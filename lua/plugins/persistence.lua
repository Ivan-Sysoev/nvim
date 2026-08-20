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
	},
}
