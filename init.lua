-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd("set textwidth=0")
vim.cmd("set wrapmargin=0")
vim.cmd("set wrap")
vim.cmd("set CodeiumDisable")
vim.cmd("set linebreak")
vim.cmd("set colorcolumn=85")
vim.cmd("set conceallevel=0") -- DONT hide characters in MD
