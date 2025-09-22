-- ╭─────────╮
-- │ Context │
-- ╰─────────╯
return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = function()
			return require("plugins.opts.bufferline")
		end,
	},

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
		"petertriho/nvim-scrollbar",
		opts = function()
			return require("plugins.opts.scrollbar")
		end,
		config = function(_, opts)
			require("scrollbar").setup(opts)
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		init = function()
			require("ibl").setup({
				indent = {
					-- highlight = { "hl-IblIndent" },
					smart_indent_cap = true,
					char = "▏",
				},
				whitespace = {
					highlight = { "Whitespace", "NonText" },
					remove_blankline_trail = true,
				},
				scope = {
					char = "⋅",
					enabled = true,
					show_start = true,
					show_end = true,
					highlight = { "Function", "Label" },
					priority = 500,
					exclude = { language = { "css" } },
				},
			})
		end,
	},
}
