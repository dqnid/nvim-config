return {
    -- ╭────────╮
    -- │ Themes │
    -- ╰────────╯
    {
        -- "dqnid/plain-colors.nvim",
        -- dir = "~/Documents/Proyectos/neovim-theme",
        dir = "~/Documents/Code/plain-colors.nvim",
        name = "rose-pine",
        opts = {
            variant = "darker", -- dark, light, darker
        },
    },

    -- ╭─────────╮
    -- │ LazyVim │
    -- ╰─────────╯
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "rose-pine",
        },
    },

    -- ╭─────╮
    -- │ LSP │
    -- ╰─────╯
    -- NOTE: DEPRECATED: Not required
    -- { "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },

    -- Simply provides basic configs for the NVIM lsp client, nothing more than data
    {
        "neovim/nvim-lspconfig",
    },

    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        opts = function()
            return require("plugins.opts.mason")
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
    -- NOTE: DEPRECATED: Not required
    -- {
    --     "pmizio/typescript-tools.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    --     opts = {
    --         settings = {
    --             tsserver_plugins = {
    --                 -- for TypeScript v4.9+
    --                 "@styled/typescript-styled-plugin",
    --                 -- or for older TypeScript versions
    --                 -- "typescript-styled-plugin",
    --             },
    --         },
    --     },
    -- },
    -- RUST
    {
        "simrat39/rust-tools.nvim",
        config = function()
            local rt = require("rust-tools")
            local mason_registry = require("mason-registry")

            local codelldb = mason_registry.get_package("codelldb")
            local extension_path = codelldb:get_install_path() .. "/extension/"
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

            rt.setup({
                tools = {
                    inlay_hints = {
                        auto = false,
                        only_current_line = false,
                        show_parameter_hints = true,
                        parameter_hints_prefix = "<- ",
                        other_hints_prefix = "=> ",
                        max_len_align = false,
                        max_len_align_padding = 1,
                        right_align = false,
                        right_align_padding = 7,
                        highlight = "Comment",
                    },
                },
                dap = {
                    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
                },
                server = {
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                },
            })
        end,
    },

    -- ╭───────────╮
    -- │ Debugging │
    -- ╰───────────╯
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    },

    -- ╭──────────────────────────╮
    -- │ TreeSitter - Code parser │
    -- ╰──────────────────────────╯
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
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = function()
            return require("plugins.opts.treesitterContext")
        end,
    },

    -- ╭──────────────────╮
    -- │ Code diagnostics │
    -- ╰──────────────────╯
    {
        "folke/trouble.nvim",
        opts = { use_diagnostic_signs = true },
    },

    -- ╭────────────────╮
    -- │ Code formatter │
    -- ╰────────────────╯
    {
        "stevearc/conform.nvim",
        opts = function()
            return require("plugins.opts.conformFormat")
        end,
    },

    -- ╭───────────────╮
    -- │ Code comments │
    -- ╰───────────────╯
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

    -- ╭──────────────────╮
    -- │ Completion Utils │
    -- ╰──────────────────╯
    -- Blink is instaled by default by LazyVim
    -- NOTE: Reason to choose nvim-cmp over blink:
    --  blink tends to create a snap lag while typing
    {
        "blink.cmp",
        enabled = false,
    },
    {
        "hrsh7th/nvim-cmp",
        enabled = true,
        dependencies = {
            "hrsh7th/cmp-emoji",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-emoji",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-path",
        },
        opts = function()
            return require("plugins.opts.cmp")
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    {
        "saadparwaiz1/cmp_luasnip",
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
    },

    -- ╭────────────╮
    -- │ Blueprints │
    -- ╰────────────╯
    {
        "dqnid/nvim-blueprints",
        name = "blueprints",
        init = function()
            require("blueprints").setup({ blueprintsDir = "/home/danih/.config/nvim/blueprints" })
        end,
    },

    -- ╭─────╮
    -- │ Git │
    -- ╰─────╯
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

    -- ╭─────────╮
    -- │ Context │
    -- ╰─────────╯
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = function()
            return require("plugins.opts.bufferline")
        end,
    },

    -- Separate buffers in tabs
    { "tiagovla/scope.nvim", config = true },

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = function()
            return require("plugins.opts.lualine")
        end,
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
            {
                "s1n7ax/nvim-window-picker",
                version = "2.*",
                config = function()
                    require("window-picker").setup({
                        filter_rules = {
                            include_current_win = false,
                            autoselect_one = true,
                            bo = {
                                filetype = { "neo-tree", "neo-tree-popup", "notify" },
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

    {
        "stevearc/aerial.nvim",
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        init = function()
            require("ibl").setup({
                whitespace = {
                    highlight = { "Whitespace", "NonText" },
                    remove_blankline_trail = true,
                },
                scope = { exclude = { language = { "lua", "css" } } },
            })
        end,
    },

    -- ╭───────────╮
    -- │ Telescope │
    -- ╰───────────╯
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

    -- ╭────────────╮
    -- │ Navigation │
    -- ╰────────────╯
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
        },
    },

    -- ╭─────────╮
    -- │ Styling │
    -- ╰─────────╯
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
            stiffness = 0.8, -- 0.6      [0, 1]
            trailing_stiffness = 0.5, -- 0.4      [0, 1]
            stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
            trailing_stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
            distance_stop_animating = 0.5, -- 0.1      > 0
        },
    },

    -- ╭───────────────╮
    -- │ Notifications │
    -- ╰───────────────╯
    {
        "rcarriga/nvim-notify",
        enabled = false,
        -- opts = function()
        --     return require("plugins.opts.notify")
        -- end,
    },

    -- ╭──────────╮
    -- │ Sessions │
    -- ╰──────────╯
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

    -- ╭────────────────╮
    -- │ Center windows │
    -- ╰────────────────╯
    { "shortcuts/no-neck-pain.nvim", version = "*" },

    -- ╭──────────╮
    -- │ OPTIONAL │
    -- ╰──────────╯
    --------------
    -- "ThePrimeagen/vim-be-good",
    -- { "mbbill/undotree", lazy = false },
    -- Mini map
    -- {
    --     "echasnovski/mini.map",
    --     version = "*",
    --     opts = function()
    --         return require("plugins.opts.minimap")
    --     end,
    -- },
    -- require('mini.map').open()
    -- IA with codium
    -- "Exafunction/codeium.vim",
    -- Lint
    -- {
    --     "mfussenegger/nvim-lint",
    -- },
    -- Vim flog utility
    -- {
    --     "rbong/vim-flog",
    --     lazy = true,
    --     cmd = { "Flog", "Flogsplit", "Floggit" },
    --     dependencies = {
    --         "tpope/vim-fugitive",
    --     },
    -- },
    -- ╭───────────╮
    -- │ Terminals │
    -- ╰───────────╯
    -- {
    --     "akinsho/toggleterm.nvim",
    --     lazy = false,
    --     version = "*",
    --     opts = function()
    --         return require("plugins.opts.toggleterm")
    --     end,
    -- },
    -- ╭──────────╮
    -- │ Previews │
    -- ╰──────────╯
    -- {
    --     "toppair/peek.nvim",
    --     event = { "VeryLazy" },
    --     build = "deno task --quiet build:fast",
    --     config = function()
    --         require("peek").setup({
    --             auto_load = true,
    --             close_on_bdelete = true, -- close preview window on buffer delete
    --
    --             theme = "dark", -- 'dark' or 'light'
    --
    --             update_on_change = true,
    --
    --             app = { "chromium", "--new-window" },
    --
    --             filetype = { "markdown" },
    --
    --             -- relevant if update_on_change is true
    --             throttle_at = 200000, -- start throttling when file exceeds this
    --             -- amount of bytes in size
    --             throttle_time = "auto",
    --         })
    --         vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    --         vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    --         vim.api.nvim_create_user_command("MarkdownPreviewOpen", require("peek").open, {})
    --         vim.api.nvim_create_user_command("MarkdownPreviewClose", require("peek").close, {})
    --     end,
    -- },
    -- ╭──────────╮
    -- │ Obsidian │
    -- ╰──────────╯
    -- {
    --     "epwalsh/obsidian.nvim",
    --     version = "*", -- recommended, use latest release instead of latest commit
    --     lazy = true,
    --     ft = "markdown",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --     },
    --     opts = {
    --         workspaces = {
    --             {
    --                 name = "default",
    --                 path = "~/Remote/Cloud/Documents/notes/md",
    --             },
    --         },
    --     },
    -- },
    -- ╭──────────╮
    -- │ WhichKey │
    -- ╰──────────╯
    -- {
    --     "folke/which-key.nvim",
    --     event = "VeryLazy",
    --     opts = {},
    --     keys = {
    --         {
    --             "<leader>?",
    --             function()
    --                 require("which-key").show({ global = false })
    --             end,
    --             desc = "Buffer Local Keymaps (which-key)",
    --         },
    --     },
    -- },
}
