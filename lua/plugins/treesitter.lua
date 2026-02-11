-- add more treesitter parsers
return {
	"nvim-treesitter/nvim-treesitter",

	opts = {
		ensure_installed = {
			"c",
			"cpp",
			"typst",
			"python",
			"lua",
			"html",
			"css",
			"javascript",
			"json",
			"bash",
			"markdown",
			"markdown_inline",
			"query",
			"regex",
			"tsx",
			"typescript",
			"vim",
			"yaml",
		},
	},
}
