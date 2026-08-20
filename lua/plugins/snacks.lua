return {
	"folke/snacks.nvim",
	keys = {
		{ "<leader>n", false },
		{
			"<leader>nh",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
	},
	opts = {
		dashboard = { enabled = false }, -- the session restores itself, no start screen needed
		notifier = { level = vim.log.levels.WARN }, -- only warnings and errors pop up
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

