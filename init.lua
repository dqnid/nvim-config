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
vim.cmd("set rnu")
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
    vert = "▏",
    stl = " ",
    eob = " ",
}
vim.opt.listchars = {
    tab = "> ",
    trail = " ",
    nbsp = "+",
}

-- ╭─────╮
-- │ LSP │
-- ╰─────╯
vim.lsp.enable('astro')
vim.lsp.enable('bashls')
vim.lsp.enable('clangd')
vim.lsp.enable('cssls')
vim.lsp.enable('emmet')
vim.lsp.enable('gopls')
vim.lsp.enable('html')
vim.lsp.enable('jdtls')
vim.lsp.enable('luals')
vim.lsp.enable('pyright')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('solargraph')
vim.lsp.enable('tsserver')
vim.lsp.enable('volar')
vim.lsp.enable('json')
