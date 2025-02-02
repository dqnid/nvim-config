local config = {
    views = {
        cmdline_popup = {
            position = {
                row = 3,
                col = "50%",
            },
            size = {
                width = 60,
                height = "auto",
            },
        },
        cmdline_popupmenu = {
            position = {
                row = 6,
                col = "50%",
            },
            size = {
                width = 60,
                height = "auto",
            },
        },
    },
    cmdline = {
        enabled = true,
        view = "cmdline_popup",
        opts = {},
        ---@type table<string, CmdlineFormat>
        format = {
            cmdline = { pattern = "^:", icon = "λ", lang = "vim", title = "" },
            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
            filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
            lua = {
                pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
                icon = "",
                lang = "lua",
            },
            help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
            input = {}, -- Used by input()
            -- lua = false, -- to disable a format, set to `false`
        },
    },
    notify = {
        -- Noice can be used as `vim.notify` so you can route any notification like other messages
        -- Notification messages have their level and other properties set.
        -- event is always "notify" and kind can be any log level as a string
        -- The default routes will forward notifications to nvim-notify
        -- Benefit of using Noice for this is the routing and consistent history view
        enabled = false,
        view = "notify",
    },
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
    },
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    routes = {
        { view = "cmdline", filter = { event = "msg_showmode" } },
        {
            filter = {
                event = "msg_show",
                kind = "",
                find = "written",
            },
            opts = { skip = true },
        },
    },
}

return config
