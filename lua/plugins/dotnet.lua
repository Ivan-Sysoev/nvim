return {
	{
		"GustavEikaas/easy-dotnet.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim", "mfussenegger/nvim-dap" },
		opts = {
			picker = "snacks",
			auto_bootstrap_namespace = { enabled = false },
			test_runner = { neotest_integration = true },
			lsp = {
				config = {
					settings = {
						["csharp|completion"] = {
							dotnet_show_completion_items_from_unimported_namespaces = true,
							dotnet_show_name_completion_suggestions = true,
						},
						["csharp|background_analysis"] = {
							dotnet_analyzer_diagnostics_scope = "openFiles",
							dotnet_compiler_diagnostics_scope = "fullSolution",
						},
						["csharp|formatting"] = {
							dotnet_organize_imports_on_format = true,
						},
					},
				},
			},
		},
		config = function(_, opts)
			require("easy-dotnet").setup(opts)
		end,
		keys = {
			{ "<leader>n", "", desc = "+.NET" },
			{ "<leader>nb", "<cmd>Dotnet build quickfix<cr>", desc = "Build (quickfix)" },
			{ "<leader>nr", "<cmd>Dotnet run<cr>", desc = "Run" },
			{ "<leader>nw", "<cmd>Dotnet watch<cr>", desc = "Watch" },
			{ "<leader>nd", "<cmd>Dotnet debug<cr>", desc = "Debug" },
			{ "<leader>nt", "<cmd>Dotnet testrunner<cr>", desc = "Test runner" },
			{ "<leader>nR", "<cmd>Dotnet restore<cr>", desc = "Restore" },
			{ "<leader>na", "<cmd>Dotnet add package<cr>", desc = "Add NuGet package" },
			{ "<leader>nx", "<cmd>Dotnet remove package<cr>", desc = "Remove NuGet package" },
			{ "<leader>no", "<cmd>Dotnet outdated<cr>", desc = "Outdated packages" },
			{ "<leader>nn", "<cmd>Dotnet new<cr>", desc = "New project/item" },
			{ "<leader>nu", "<cmd>Dotnet secrets<cr>", desc = "User secrets" },
			{ "<leader>nS", "<cmd>Dotnet solution select<cr>", desc = "Select solution" },
			{ "<leader>nT", "<cmd>Dotnet terminal toggle<cr>", desc = "Toggle terminal" },
		},
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				omnisharp = { enabled = false },
			},
		},
	},

	{ "Nsidorenco/neotest-vstest", enabled = false },
	{
		"nvim-neotest/neotest",
		optional = true,
		opts = {
			adapters = {
				["neotest-vstest"] = false,
				["easy-dotnet.neotest"] = {},
			},
		},
	},

	{
		"mfussenegger/nvim-dap",
		optional = true,
		keys = function(_, keys)
			for _, key in ipairs(keys) do
				if type(key[1]) == "string" then
					key[1] = (key[1]:gsub("^<leader>d", "<leader>D"))
				end
			end
			return keys
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		optional = true,
		keys = function(_, keys)
			for _, key in ipairs(keys) do
				if type(key[1]) == "string" then
					key[1] = (key[1]:gsub("^<leader>d", "<leader>D"))
				end
			end
			return keys
		end,
	},
	{
		"folke/which-key.nvim",
		optional = true,
		opts = {
			spec = {
				{ "<leader>D", group = "debug" },
			},
		},
	},
}
