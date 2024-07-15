return {
    -- Themes
    { "mellow-theme/mellow.nvim" },
    {
        "dgox16/oldworld.nvim",
        lazy = false,
        priority = 1000,
    },
    --vim.cmd("colorscheme rose-pine")
    -- vim.cmd("colorscheme rose-pine-main")
    -- vim.cmd("colorscheme rose-pine-moon")
    -- vim.cmd("colorscheme rose-pine-dawn")
    { "rose-pine/neovim", name = "rose-pine" },
    "shaunsingh/nord.nvim", -- nord

    -- Configure LazyVim to load colorscheme
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "oldworld",
        },
    },

    -- use mini.starter instead of alpha
    { import = "lazyvim.plugins.extras.ui.mini-starter" },

    { import = "lazyvim.plugins.extras.lang.json" },
    {
        "dqnid/nvim-blueprints",
        name = "blueprints",
        init = function()
            require("blueprints").setup({ blueprintsDir = "/home/danih/.config/nvim/blueprints" })
        end,
    },
    -- add tsserver and setup with typescript.nvim instead of lspconfig
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            "jose-elias-alvarez/typescript.nvim",
        },
        opts = function()
            return require("plugins.opts.lspconfig")
        end,
        config = function()
            require("plugins.configs.lspconfig")
        end,
    },

    -- lsp stuff
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        opts = function()
            return require("plugins.opts.mason")
        end,
        config = function(_, opts)
            require("mason").setup(opts)

            -- custom nvchad cmd to install all mason binaries listed
            vim.api.nvim_create_user_command("MasonInstallAll", function()
                vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
            end, {})

            vim.g.mason_binaries_list = opts.ensure_installed
        end,
    },

    -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
    -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
    { import = "lazyvim.plugins.extras.lang.typescript" },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = function()
            return require("plugins.opts.treesitter")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = function()
            return require("plugins.opts.treesitterContext")
        end,
    },

    -- Basics
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
    },

    -- JSON and YML schema catalog
    -- * Usefull because a schema describes the structure of data in a document
    {
        "b0o/schemastore.nvim",
        init = function()
            require("lspconfig").jsonls.setup({
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = { enable = true },
                    },
                },
            })
        end,
    },

    -- Tab line
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = function()
            return require("plugins.opts.bufferline")
        end,
    },

    -- Indents
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        init = function()
            require("ibl").setup({
                indent = { char = "|" },
                whitespace = {
                    highlight = { "Whitespace", "NonText" },
                    remove_blankline_trail = true,
                },
                scope = { exclude = { language = { "lua", "css" } } },
            })
        end,
    },

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-emoji" },
        opts = function()
            return require("plugins.opts.cmp")
        end,
    },
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",

    -- Format
    {
        "stevearc/conform.nvim",
        opts = function()
            return require("plugins.opts.conformFormat")
        end,
    },

    -- LINE
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = function()
            return require("plugins.opts.lualine")
        end,
    },
    -- Extend styles for vim.input, vim.select, etc.
    {
        "stevearc/dressing.nvim",
        opts = function()
            return require("plugins.opts.dressing")
        end,
    },

    -- Enhance find functions (f, t, F, T)
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "x", "o" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Treesitter Search",
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
        },
    },

    -- GIT
    {
        "lewis6991/gitsigns.nvim",
        opts = function()
            return require("plugins.opts.gitsigns")
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>glg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    },
    {
        "sindrets/diffview.nvim",
        lazy = false,
    },

    -- File tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x", -- TODO: remove
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
            {
                "s1n7ax/nvim-window-picker",
                version = "2.*",
                config = function()
                    require("window-picker").setup({
                        filter_rules = {
                            include_current_win = false,
                            autoselect_one = true,
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { "neo-tree", "neo-tree-popup", "notify" },
                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { "terminal", "quickfix" },
                            },
                        },
                    })
                end,
            },
        },
        opts = function()
            return require("plugins.opts.neotree")
        end,
    },

    -- Style
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

    -- Lint
    {
        "mfussenegger/nvim-lint",
    },

    -- Notify
    {
        "rcarriga/nvim-notify",
        opts = function()
            return require("plugins.opts.notify")
        end,
    },

    -- Text insights
    {
        "folke/trouble.nvim",
        -- opts will be merged with the parent spec
        opts = { use_diagnostic_signs = true },
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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

    {
        "numToStr/Comment.nvim",
        keys = {
            { "gcc", mode = "n", desc = "Comment toggle current line" },
            { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
            { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
            { "gbc", mode = "n", desc = "Comment toggle current block" },
            { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
            { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
        },
        config = function(_, opts)
            require("Comment").setup(opts)
        end,
    },

    -- Markdown preview
    {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup({
                auto_load = true,
                close_on_bdelete = true, -- close preview window on buffer delete

                theme = "dark", -- 'dark' or 'light'

                update_on_change = true,

                app = { "chromium", "--new-window" },

                filetype = { "markdown" },

                -- relevant if update_on_change is true
                throttle_at = 200000, -- start throttling when file exceeds this
                -- amount of bytes in size
                throttle_time = "auto",
            })
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
            vim.api.nvim_create_user_command("MarkdownPreviewOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("MarkdownPreviewClose", require("peek").close, {})
        end,
    },

    {
        "rmagatti/session-lens",
        requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
        config = function()
            require("session-lens").setup({
                prompt_title = "LAST SESSIONS",
                path_display = { "shorten" },
                theme = "ivy", -- default is dropdown
                theme_conf = { border = false },
                previewer = true,
            })
        end,
        lazy = false,
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
        config = function()
            require("typescript-tools").setup({
                settings = {
                    tsserver_plugins = {
                        -- for TypeScript v4.9+
                        "@styled/typescript-styled-plugin",
                        -- or for older TypeScript versions
                        -- "typescript-styled-plugin",
                    },
                },
            })
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end,
    },
    {

        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            })
        end,
        lazy = false,
    },

    -- IA with codium
    "Exafunction/codeium.vim",
}
