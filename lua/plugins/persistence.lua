return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	-- Auto-restore the session when nvim is started without arguments
	init = function()
		vim.api.nvim_create_autocmd("VimEnter", {
			nested = true,
			callback = function()
				if vim.fn.argc() == 0 then
					-- schedule: load after startup, otherwise FileType never fires
					vim.schedule(function()
						require("persistence").load()
					end)
				end
			end,
		})
	end,
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
