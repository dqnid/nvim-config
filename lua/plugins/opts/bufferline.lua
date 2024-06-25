local config = {
    highlights = {
        buffer_selected = { bold = true },
        diagnostic_selected = { bold = true },
        info_selected = { bold = true },
        info_diagnostic_selected = { bold = true },
        warning_selected = { bold = true },
        warning_diagnostic_selected = { bold = true },
        error_selected = { bold = true },
        error_diagnostic_selected = { bold = true },
    },
    options = {
        themeable = true,
        numbers = "none",
        diagnostics = "nvim_lsp",
        max_prefix_length = 8,
        close_command = "b# | bd#",
        right_mouse_command = "b# | bd#",
        left_mouse_command = "buffer %d",
        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        truncate_names = true,
        tab_size = 18,
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_tab_indicators = true,
        duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = "slope", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        always_show_bufferline = false,
        auto_toggle_bufferline = true,
        show_close_icon = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = { "close" },
        },
    },
}

return config
