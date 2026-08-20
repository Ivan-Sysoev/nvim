-- return {
-- 	"olimorris/persisted.nvim",
-- 	lazy = false, -- Needs to load early to hook into events
-- 	opts = {
-- 		autostart = true,
-- 		-- CRITICAL STEP: This tells the plugin to manually save your registers
-- 		save_data = { "registers" },
-- 	},
-- 	keys = {
-- 		-- Shortcut to load the session for the current folder
-- 		{ "<leader>rs", "<cmd>SessionLoad<cr>", desc = "Restore Session" },
-- 	},
-- }

return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {
		-- "globals" is the key here; it tells Neovim to save registers/macros
		options = { "buffers", "curdir", "tabpages", "winsize", "globals" },
	},
	keys = {
		-- Press <leader>qs to restore the session for the current folder
		{
			"<leader>qs",
			function()
				require("persistence").load()
			end,
			desc = "Restore Session",
		},
	},
}
