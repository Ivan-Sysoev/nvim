-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "c", "cpp", "cmake" },
	callback = function()
		vim.b.autoformat = false
	end,
})

-- Shift+Q for just recorded macros
vim.g.last_recorded_reg = "q"
vim.api.nvim_create_autocmd("RecordingLeave", {
	callback = function()
		local reg = vim.fn.reg_recording()
		if reg ~= "" then
			vim.g.last_recorded_reg = reg
		end
	end,
})

-- -- Deletes Ex buffer on session recover
-- -- Make startup slower, so just don't enter with nvim .
-- local function unlist_directory_buffer(buf)
-- 	if vim.fn.isdirectory(vim.api.nvim_buf_get_name(buf)) == 1 then
-- 		vim.bo[buf].buflisted = false
-- 	end
-- end
--
-- vim.api.nvim_create_autocmd("BufAdd", {
-- 	callback = function(event)
-- 		unlist_directory_buffer(event.buf)
-- 	end,
-- })
--
-- vim.tbl_map(unlist_directory_buffer, vim.api.nvim_list_bufs())
