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
    { "tpope/vim-fugitive" }
}
