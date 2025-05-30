-- ╭────────────╮
-- │ Blueprints │
-- ╰────────────╯
return {
    {
        "dqnid/nvim-blueprints",
        name = "blueprints",
        init = function()
            require("blueprints").setup({ blueprintsDir = "/home/danih/.config/nvim/blueprints" })
        end,
    },
}
