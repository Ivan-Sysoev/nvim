-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "lazy",
    callback = function()
        vim.cmd.close()
    end,
})

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
