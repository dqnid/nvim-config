-- ╭─────╮
-- │ Git │
-- ╰─────╯
return {
    {
        "lewis6991/gitsigns.nvim",
        opts = function()
            return require("plugins.opts.gitsigns")
        end,
    },

    {
        "sindrets/diffview.nvim",
        lazy = false,
    },

    { "tpope/vim-fugitive" },

    {
        dir = "~/Documents/Code/monkey-alert.nvim",
        name = "monkey-alert",
        opts = {
            monkey_mail_list = "john@doe.org,another@dude.me,dani.heras@hotmail.com",
            blame_text_color_hex = "#c0ffee",
            blame_text = "- Monkey alert 🐒",
            blame_position = "eol",
            auto_attach = true
        },
    },
}
