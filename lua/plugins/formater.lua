-- ╭────────────────╮
-- │ Code formatter │
-- ╰────────────────╯
return {
    {
        "stevearc/conform.nvim",
        opts = function()
            return require("plugins.opts.conformFormat")
        end,
    },
}
