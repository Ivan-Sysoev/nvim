return {
	"folke/persistence.nvim",
	event = "BufReadPre",

	opts = {
		-- "globals" is the key here; it tells Neovim to save registers/macros
		options = { "buffers", "curdir", "tabpages", "winsize", "globals" },
	},
	keys = {
		-- Press <leader>rs to restore the session for the current folder
		{
			"<leader>rs",
			function()
				require("persistence").load()
			end,
			desc = "Restore Session",
		},

		-- Press <leader>ls to pick a session from any folder, newest first
		{
			"<leader>ls",
			function()
				require("persistence").select()
			end,
			desc = "List Sessions",
		},

		-- Press <leader>ns to start from a clean slate in this folder
		{
			"<leader>ns",
			function()
				vim.cmd("%bdelete") -- aborts with E89 if a buffer has unsaved changes
				os.remove(require("persistence").current())
				vim.notify("New session started", vim.log.levels.INFO)
			end,
			desc = "New Session",
		},
	},
}
