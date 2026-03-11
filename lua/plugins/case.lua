return {
	"endaaman/vim-case-master",
	event = "VeryLazy", -- Optional: load the plugin after startup
	config = function()
		-- Optional: Add any specific configuration or keymaps here
		-- For example, to map the case switching function:
		vim.api.nvim_set_keymap("n", "<leader>tp", ":CaseMasterConvertToPascal<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>ts", ":CaseMasterConvertToSnake<CR>", { noremap = true, silent = true })
	end,
}
