-- ╭──────╮
-- │ Init │
-- ╰──────╯
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_netrw = 0
vim.cmd("set termguicolors")
require("config")

-- ╭─────────╮
-- │ Generic │
-- ╰─────────╯
vim.cmd("set nu rnu")
vim.cmd("set textwidth=0")
vim.cmd("set wrapmargin=0")
vim.cmd("set linebreak")
-- vim.cmd("set colorcolumn=85")
vim.cmd("set conceallevel=0") -- DONT hide characters in MD
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set wrap")
vim.lsp.inlay_hint.enable(false)
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- ╭─────────────╮
-- │ Colorscheme │
-- ╰─────────────╯
vim.cmd("colorscheme rose-pine")

-- ╭───────────────────╮
-- │ Default clipboard │
-- ╰───────────────────╯
vim.cmd("set clipboard=unnamedplus")

-- ╭───────╮
-- │ Chars │
-- ╰───────╯
vim.opt.fillchars = {
	horiz = "━",
	vert = "│",
	stl = " ",
	eob = " ",
}
vim.opt.listchars = {
	tab = "> ",
	trail = " ",
	nbsp = "+",
}

vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
