return {
	--  "folke/tokyonight.nvim",
	--  lazy = false,
	--  priority = 1000, -- ensures the colorscheme loads first
	--  opts = {
	--    style = "night", -- set the style to 'night'
	--  },
	"rockyzhang24/arctic.nvim",
	dependencies = { "rktjmp/lush.nvim" },
	name = "arctic",
	branch = "main",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme arctic")
	end,
}
