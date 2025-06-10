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
    -- {
    --     "nvim-treesitter/nvim-treesitter-context",
    --     opts = function()
    --         return require("plugins.opts.treesitterContext")
    --     end,
    -- },

    -- │ Completion │
    {
      'saghen/blink.cmp',
      -- dependencies = { 'rafamadriz/friendly-snippets' },
      version = '1.*',
      opts = {
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        keymap = { preset = 'default' },
        appearance = {
          nerd_font_variant = 'mono'
        },
        -- (Default) Only show the documentation popup when manually triggered
        completion = { documentation = { auto_show = false } },
        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
      },
      opts_extend = { "sources.default" }
    },
    -- {
    --     "L3MON4D3/LuaSnip",
    --     build = "make install_jsregexp",
    --     dependencies = { "rafamadriz/friendly-snippets" },
    -- },
    --
    -- -- │ Auto close │
    -- {
    --     "m4xshen/autoclose.nvim",
    -- },
    --
    -- {
    --     "windwp/nvim-ts-autotag",
    --     config = function(_, opts)
    --         require('nvim-ts-autotag').setup({
    --           opts = {
    --             enable_close = true, -- Auto close tags
    --             enable_rename = true, -- Auto rename pairs of tags
    --             enable_close_on_slash = false -- Auto close on trailing </
    --           },
    --           per_filetype = {
    --             ["html"] = {
    --               enable_close = true
    --             }
    --           }
    --         })
    --     end,
    -- },
    --
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
