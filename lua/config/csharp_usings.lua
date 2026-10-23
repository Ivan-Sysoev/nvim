local M = {}

M.client_name = "easy_dotnet"

function M.usings_end(lines)
	local last = -1
	for i, line in ipairs(lines) do
		if line:match("^%s*global%s+using%s") or line:match("^%s*using%s+[%w_.=%s<>,%[%]]+;") then
			last = i - 1
		elseif not (line:match("^%s*$") or line:match("^%s*//") or line:match("^%s*#")) then
			break
		end
	end
	return last
end

function M.filter_edits(edits, last)
	return vim.tbl_filter(function(edit)
		local e = edit.range["end"]
		return e.line <= last or (e.line == last + 1 and e.character == 0)
	end, edits or {})
end

function M.organize(buf)
	buf = buf or vim.api.nvim_get_current_buf()
	if vim.b[buf].cs_organize_usings == false then
		return
	end
	local client = vim.lsp.get_clients({ bufnr = buf, name = M.client_name })[1]
	if not client then
		return
	end

	local last = M.usings_end(vim.api.nvim_buf_get_lines(buf, 0, 300, false))
	if last < 0 then
		return
	end

	local params = {
		textDocument = { uri = vim.uri_from_bufnr(buf) },
		options = {
			tabSize = vim.bo[buf].shiftwidth > 0 and vim.bo[buf].shiftwidth or vim.bo[buf].tabstop,
			insertSpaces = vim.bo[buf].expandtab,
		},
	}
	local resp = client:request_sync("textDocument/formatting", params, 2000, buf)
	if not resp or resp.err or type(resp.result) ~= "table" then
		return
	end

	local edits = M.filter_edits(resp.result, last)
	if #edits > 0 then
		vim.lsp.util.apply_text_edits(edits, buf, client.offset_encoding)
	end
end

vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("csharp_organize_usings", { clear = true }),
	pattern = "*.cs",
	callback = function(args)
		M.organize(args.buf)
	end,
})

vim.api.nvim_create_user_command("CsOrganizeUsings", function()
	M.organize()
end, { desc = "Sort C# usings (Roslyn)" })

return M
