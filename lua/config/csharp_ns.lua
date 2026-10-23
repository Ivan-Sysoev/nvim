local M = {}

function M.namespace_for(file)
	local dir = vim.fs.dirname(file)
	local csproj = vim.fs.find(function(name)
		return name:match("%.csproj$") ~= nil
	end, { path = dir, upward = true, type = "file" })[1]
	if not csproj then
		return nil
	end

	local proj_dir = vim.fs.dirname(csproj)
	local root_ns = vim.fn.fnamemodify(csproj, ":t:r")

	for _, line in ipairs(vim.fn.readfile(csproj)) do
		local ns = line:match("<RootNamespace>%s*(.-)%s*</RootNamespace>")
		if ns and ns ~= "" then
			root_ns = ns
			break
		end
	end

	local rel = dir:sub(#proj_dir + 2)
	local ns = root_ns
	if rel ~= "" then
		ns = ns .. "." .. rel:gsub("/", ".")
	end
	ns = ns:gsub("[^%w_.]", "_")
	return ns
end

local function fill_template(buf)
	if not vim.api.nvim_buf_is_valid(buf) or vim.bo[buf].modified then
		return
	end
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
	if #lines > 1 or lines[1] ~= "" then
		return
	end

	local file = vim.fs.normalize(vim.api.nvim_buf_get_name(buf))
	local ns = M.namespace_for(file)
	if not ns then
		return
	end
	local name = vim.fn.fnamemodify(file, ":t:r")
	local kind = name:match("^I%u") and "public interface " or "public sealed class "

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
		"namespace " .. ns .. ";",
		"",
		kind .. name,
		"{",
		"",
		"}",
	})

	vim.fn.mkdir(vim.fs.dirname(file), "p")
	vim.api.nvim_buf_call(buf, function()
		vim.cmd("silent noautocmd write")
	end)

	if vim.api.nvim_get_current_buf() == buf then
		vim.api.nvim_win_set_cursor(0, { 5, 0 })
	end
end

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
	group = vim.api.nvim_create_augroup("csharp_namespace", { clear = true }),
	pattern = "*.cs",
	callback = function(args)
		fill_template(args.buf)
	end,
})

for _, buf in ipairs(vim.api.nvim_list_bufs()) do
	if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf):match("%.cs$") then
		fill_template(buf)
	end
end

vim.api.nvim_create_user_command("CsFixNamespace", function()
	local buf = vim.api.nvim_get_current_buf()
	local ns = M.namespace_for(vim.fs.normalize(vim.api.nvim_buf_get_name(buf)))
	if not ns then
		vim.notify("Не найден .csproj", vim.log.levels.WARN)
		return
	end
	for i, line in ipairs(vim.api.nvim_buf_get_lines(buf, 0, -1, false)) do
		local indent, rest = line:match("^(%s*)namespace%s+[%w_.]+(.*)$")
		if indent then
			vim.api.nvim_buf_set_lines(buf, i - 1, i, false, { indent .. "namespace " .. ns .. rest })
			vim.notify("namespace → " .. ns)
			return
		end
	end
	vim.notify("Строка namespace не найдена", vim.log.levels.WARN)
end, { desc = "Set C# namespace to match folder" })

return M
