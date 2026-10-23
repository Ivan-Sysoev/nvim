return {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },

    config = function()
        local u = require("treesj.langs.utils")

        require("treesj").setup({
            use_default_keymaps = true,
            langs = {
                c_sharp = {
                    argument_list = u.set_preset_for_args({
                        both = { omit = { ")" } },
                        split = { last_indent = "inner" },
                    }),
                    parameter_list = u.set_preset_for_args({
                        both = { omit = { ")" } },
                        split = { last_indent = "inner" },
                    }),
                    initializer_expression = u.set_preset_for_list({
                        both = { omit = { "}" } },
                        split = { last_indent = "inner" },
                    }),
                },
            },
        })
    end,
}
