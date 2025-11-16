-- ╭───────────╮
-- │ Telescope │
-- ╰───────────╯
return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            {
                "isak102/telescope-git-file-history.nvim",
                dependencies = {
                    "nvim-lua/plenary.nvim",
                    "tpope/vim-fugitive",
                },
            },
        },
        cmd = "Telescope",
        opts = function()
            return require("plugins.opts.telescope")
        end,
        config = function(_, opts)
            local telescope = require("telescope")
            telescope.setup(opts)

            -- load extensions
            for _, ext in ipairs(opts.extensions_list) do
                telescope.load_extension(ext)
            end
        end,
    },
    -- Multi buffer search
    {
        "nvim-pack/nvim-spectre",
    },
    -- Multi buffer search + replace
    {
        'gabrielpoca/replacer.nvim',
        opts = { rename_files = false },
        keys = {
            {
                '<leader>h',
                function() require('replacer').run() end,
                desc = "run replacer.nvim"
            }
        }
    }
}
