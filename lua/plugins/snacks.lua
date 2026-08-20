return {
	"folke/snacks.nvim",
	opts = {
		dashboard = { enabled = false }, -- the session restores itself, no start screen needed
		explorer = {
			enabled = false,
			trash = true, -- Use the system trash when deleting files

			finder = {
				args = { "--hidden", "--no-ignore" },
			},
		},
		picker = {
			sources = {
				explorer = {
					jump = { close = true }, -- close the explorer after opening a file
				},
				files = {
					hidden = true,
					ignored = true,
				},
			},
		},
	},
}

