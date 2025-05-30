-- ╭────────────╮
-- │ Code utils │
-- ╰────────────╯
return {
    -- │ Code parse │
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function()
            return require("plugins.opts.treesitter")
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    -- To test if TreeSitter is working
    -- "nvim-treesitter/playground",
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = function()
            return require("plugins.opts.treesitterContext")
        end,
    },

    -- │ Completion │
    {
        "hrsh7th/nvim-cmp",
        enabled = true,
        dependencies = {
            "hrsh7th/cmp-emoji",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-emoji",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-path",
        },
        opts = function()
            return require("plugins.opts.cmp")
        end,
    },

    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    {
        "saadparwaiz1/cmp_luasnip",
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
    },

    -- │ Auto close │
    {
        "m4xshen/autoclose.nvim",
    },

    {
        "windwp/nvim-ts-autotag",
        config = function(_, opts)
            require('nvim-ts-autotag').setup({
              opts = {
                enable_close = true, -- Auto close tags
                enable_rename = true, -- Auto rename pairs of tags
                enable_close_on_slash = false -- Auto close on trailing </
              },
              per_filetype = {
                ["html"] = {
                  enable_close = true
                }
              }
            })
        end,
    },

    -- │ Diagnostics │
    {
        "folke/trouble.nvim",
        opts = { use_diagnostic_signs = true },
    },

    -- │ Easy comments │
    {
        "numToStr/Comment.nvim",
        keys = {
            { "gcc", mode = "n",          desc = "Comment toggle current line" },
            { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
            { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
            { "gbc", mode = "n",          desc = "Comment toggle current block" },
            { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
            { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
        },
        config = function(_, opts)
            require("Comment").setup(opts)
        end,
    },
}
