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
		diagnostics = "nvim_lsp", -- or "coc"
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
		separator_style = { "▏", "" }, -- { "▏", "" } | "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
		-- always_show_bufferline = false,
		auto_toggle_bufferline = true,
		show_close_icon = true,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		offsets = {
			{
				filetype = "neo-tree",
				text = "",
				highlight = "Directory",
				separator = "│", -- use a "true" to enable the default, or set your own character
			},
		},
		groups = {
			options = {
				toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
			},
			items = {
				{
					name = "Tests",
					highlight = { underline = false, sp = "blue" },
					priority = 2,
					-- icon = " ",
					matcher = function(buf)
						return buf.path:match("%_test") or buf.path:match("%_spec")
					end,
				},
				{
					name = "Docs",
					-- icon = "󰈙 ",
					highlight = { undercurl = false, sp = "green" },
					auto_close = false,
					matcher = function(buf)
						return buf.path:match("%.md") or buf.path:match("%.txt")
					end,
					separator = {
						style = require("bufferline.groups").separator.tab,
					},
				},
				{
					name = "Shells",
					highlight = { undercurl = false, sp = "grey" },
					auto_close = false,
					matcher = function(buf)
						return buf.path:match("zsh")
					end,
					separator = {
						style = require("bufferline.groups").separator.tab,
					},
				},
				{
					name = "Docker",
					highlight = { undercurl = false, sp = "blue" },
					auto_close = false,
					matcher = function(buf)
						return buf.path:match("dockerfile")
							or buf.path:match("DOCKERFILE")
							or buf.path:match("Dockerfile")
							or buf.path:match("docker%-compose%.yml")
					end,
					separator = {
						style = require("bufferline.groups").separator.tab,
					},
				},
			},
		},
	},
}

return config
