return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--no-ignore",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					no_ignore = true,
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--no-ignore",
					},
				},
			},
		})
	end,
}
