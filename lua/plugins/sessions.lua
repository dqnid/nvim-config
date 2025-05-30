-- ╭──────────╮
-- │ Sessions │
-- ╰──────────╯
return {
    {

        "rmagatti/auto-session",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        opts = function()
            return require("plugins.opts.autosession")
        end,
        lazy = false,
    },
}
