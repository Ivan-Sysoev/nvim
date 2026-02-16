return {
	"neovim/nvim-lspconfig",
	opts = {
		ensure_installed = {
			"lua_ls", -- Lua
			"ltex", -- LaTeX
			"pylsp", -- Python
			"clangd", -- C/C++
		},

		inlay_hints = { enabled = false }, -- Example: enable inlay hints

		servers = {
			clangd = {
				cmd = {
					"clangd",
					"--header-insertion=iwyu",
					"--header-insertion-decorators",
					"--clang-tidy",
				},
			},
		},

		capabilities = {
			textDocument = {
				completion = {
					completionItem = {
						snippetSupport = false, -- Говорим серверу: "Я не понимаю сниппеты"
					},
				},
			},
		},

		-- 	-- Example: Config Pyright
		-- 	pyright = {
		-- 		settings = {
		-- 			python = {
		-- 				analysis = {
		-- 					autoSearchPaths = true,
		-- 					useLibraryCodeForTypes = true,
		-- 					diagnosticMode = "workspace",
		-- 				},
		-- 			},
		-- 		},
		-- 	},

		lua_ls = {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		},
	},
}
