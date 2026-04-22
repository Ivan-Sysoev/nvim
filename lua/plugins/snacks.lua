return {
	"folke/snacks.nvim",
	opts = {
		explorer = {
			enabled = false,
			trash = true, -- Use the system trash when deleting files

			finder = {
				args = { "--hidden", "--no-ignore" },
			},
		},
		picker = {
			sources = {
				files = {
					hidden = true,
					ignored = true,
				},
			},
		},
	},
}

