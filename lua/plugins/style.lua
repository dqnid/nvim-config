-- ╭─────────╮
-- │ Styling │
-- ╰─────────╯
return {
    {
        -- "dqnid/plain-colors.nvim",
        -- dir = "~/Documents/Proyectos/neovim-theme",
        dir = "~/Documents/Code/plain-colors.nvim",
        name = "rose-pine",
        opts = {
            variant = "darker", -- dark, light, darker
        },
    },
    { "echasnovski/mini.icons" },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            -- OPTIONAL: (if not mini is the backup)
            -- "rcarriga/nvim-notify",
        },
        opts = function()
            return require("plugins.opts.noice")
        end,
    },

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({})
        end,
    },

    { "shortcuts/no-neck-pain.nvim", version = "*" },

    {
        "sphamba/smear-cursor.nvim",
        opts = {
            smear_between_buffers = false,
            smear_between_neighbor_lines = true,
            scroll_buffer_space = true,
            -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
            legacy_computing_symbols_support = false,
            smear_insert_mode = true,

            -- fast smear
            stiffness = 0.8,                      -- 0.6      [0, 1]
            trailing_stiffness = 0.5,             -- 0.4      [0, 1]
            stiffness_insert_mode = 0.6,          -- 0.4      [0, 1]
            trailing_stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
            distance_stop_animating = 0.5,        -- 0.1      > 0
        },
    },
}
