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

    -- │ Completion │
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        opts = {
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            keymap = {
                preset = 'default',
                ['<Enter>'] = { 'accept', 'fallback' },
                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
            },
            appearance = {
                nerd_font_variant = 'mono'
            },
            completion = { documentation = { auto_show = false } },
            sources = {
            },
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },

    -- -- │ Auto close │
    {
        "windwp/nvim-ts-autotag",
        config = function(_, opts)
            require('nvim-ts-autotag').setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = false
                },
            })
        end,
    },

    -- │ Diagnostics │
    {
        "folke/trouble.nvim",
        opts = { use_diagnostic_signs = true },
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = function()
            return require("plugins.opts.todocomments")
        end,
    }
}
