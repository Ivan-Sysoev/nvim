return {
	"neovim/nvim-lspconfig",
	opts = function(_, opts)
		opts.diagnostics = {
			virtual_text = {
				severity = { min = vim.diagnostic.severity.ERROR },
			},
		}

		opts.ensure_installed = {
			"lua_ls", -- Lua
			"ltex", -- LaTeX
			"pylsp", -- Python
			"clangd", -- C/C++
			"verible-verilog-ls", -- Verilog
		}

		opts.inlay_hints = { enabled = false }
		opts.autoformat = false

		opts.servers = {
			verible = {
				cmd = {
					"verible-verilog-ls", "--rules=-no-tabs"
				},
			},
			clangd = {
				cmd = {
					"clangd",
					"--header-insertion=iwyu",
					"--header-insertion-decorators",
					"--clang-tidy",
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
		}

		opts.capabilities = {
			textDocument = {
				completion = {
					completionItem = {
						snippetSupport = false,
					},
				},
			},
		}

		return opts
	end,
}
