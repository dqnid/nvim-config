-- This file is automatically loaded by lazyvim.config.init
local map = vim.keymap.set

-- Bufferline
map("n", "bg", "<CMD>BufferLinePick<CR>")
map("n", "<leader>bpx", "<CMD>BufferLinePickClose<CR>")
map("n", "<leader>box", "<CMD>BufferLineCloseOthers<CR>")
map("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>")
map("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>")
map("n", "bsd", "<CMD>BufferLineSortByDirectory<CR>")
map("n", "bse", "<CMD>BufferLineSortByExtension<CR>")
map("n", "bsr", "<CMD>BufferLineSortByRelativeDirectory<CR>")
map("n", "bst", "<CMD>BufferLineSortByTabs<CR>")
-- buffers
map("n", "<S-h>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer to left" })
map("n", "<S-l>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to right" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bd", LazyVim.ui.bufremove, { desc = "Delete Buffer" })
map("n", "<leader>x", LazyVim.ui.bufremove, { desc = "Delete Buffer" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Git
map("n", "<leader>gb", "<CMD>Gitsigns blame<CR>")
map("n", "<leader>gd", "<CMD>Gitsigns diffthis<CR>")
map("n", "K", "<CMD>Gitsigns blame_line<CR>")
map("n", "<leader>gtb", "<CMD>Gitsigns toggle_current_line_blame<CR>")
map("n", "<leader>gtd", "<CMD>Gitsigns toggle_deleted")
map("n", "<leader>gc", "<cmd>Telescope git_commits <CR>", { desc = "Git commits" })
map("n", "<leader>gs", "<cmd>Telescope git_status <CR>", { desc = "Git status" })

-- Treesitter context
map("n", "<leader>tc", "<cmd>TSContextToggle<CR>", { desc = "Toggle treesitter context" })

-- Blueprints
map("n", "<leader>ct", "<cmd>lua require('blueprints').createFromTemplateTelescope()<CR>", { desc = "Nvim blueprints" })

-- lazygit
map("n", "<leader>gg", function()
    LazyVim.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Lazygit (Root Dir)" })
map("n", "<leader>gG", function()
    LazyVim.lazygit()
end, { desc = "Lazygit (cwd)" })
map("n", "<leader>gb", LazyVim.lazygit.blame_line, { desc = "Git Blame Line" })
map("n", "<leader>gB", LazyVim.lazygit.browse, { desc = "Git Browse" })

map("n", "<leader>gf", function()
    local git_path = vim.api.nvim_buf_get_name(0)
    LazyVim.lazygit({ args = { "-f", vim.trim(git_path) } })
end, { desc = "Lazygit Current File History" })

map("n", "<leader>gl", function()
    LazyVim.lazygit({ args = { "log" }, cwd = LazyVim.root.git() })
end, { desc = "Lazygit Log" })
map("n", "<leader>gL", function()
    LazyVim.lazygit({ args = { "log" } })
end, { desc = "Lazygit Log (cwd)" })

-- Neotree
map("n", "<C-n>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree open" })
map("n", "<leader>e", "<cmd>Neotree focus<cr>", { desc = "Focus neotree" })

-- LSP
map("n", "gD", function()
    vim.lsp.buf.declaration()
end, { desc = "LSP declaration" })
map("n", "gd", function()
    vim.lsp.buf.definition()
end, { desc = "LSP definition" })
map("n", "gr", function()
    vim.lsp.buf.references()
end, { desc = "LSP references" })
map("n", "K", function()
    vim.lsp.buf.hover()
end, { desc = "LSP hover" })
map("n", "gi", function()
    vim.lsp.buf.implementation()
end, { desc = "LSP implementation" })
map("n", "<leader>ls", function()
    vim.lsp.buf.signature_help()
end, { desc = "LSP signature help" })
map("n", "<leader>lf", function()
    vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Floating diagnostics" })
map("n", "<leader>D", function()
    vim.lsp.buf.type_definition()
end, { desc = "LSP type definition" })
map("n", "<leader>ca", function()
    vim.lsp.buf.code_action()
end, { desc = "LSP code actions" })
map("n", "[d", function()
    vim.diagnostic.goto_prev({ float = { border = "rounded" } })
end, { desc = "Goto prev diagnostic" })
map("n", "]d", function()
    vim.diagnostic.goto_next({ float = { border = "rounded" } })
end, { desc = "Goto next diagnostic" })
map("v", "<leader>ca", function()
    vim.lsp.buf.code_action()
end, { desc = "LSP code action" })

map("n", "<leader>wa", function()
    vim.lsp.buf.add_workspace_folder()
end, { desc = "Add workspace folder" })
map("n", "<leader>wr", function()
    vim.lsp.buf.remove_workspace_folder()
end, { desc = "Remove workspace folder" })
map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })

-- TS lsp
map("n", "<leader>to", "TypescriptOrganizeImports", { desc = "Organize Imports" })
map("n", "<leader>tr", "TypescriptRenameFile", { desc = "Rename File" })

-- Telescope find
map("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find files" })
map("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", { desc = "Find all" })
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", { desc = "Help page" })
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", { desc = "Fild old files" })
map("n", "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { desc = "Find in current buffer" })

-- Comment
map(
    "n",
    "<leader>/",
    "<cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    { desc = "Toggle comment current" }
)

-- IA codium
map("n", "<leader>ca", "<cmd> CodeiumToggle <CR>", { desc = "Toggle codeium IA assistance" })
map("i", "<C-g>", function()
    return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
map("i", "<c-;>", function()
    return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true })
map("i", "<c-,>", function()
    return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })
map("i", "<c-x>", function()
    return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })

-- Terminal

-----------------------------------------------------------
-- Example
-----------------------------------------------------------

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
    "n",
    "<leader>ur",
    "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
    { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- commenting
-- map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
-- map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
-- map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- formatting
map({ "n", "v" }, "<leader>cf", function()
    require("conform").format({ bufnr = args.buf })
end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        go({ severity = severity })
    end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- toggle options
map("n", "<leader>uf", function()
    LazyVim.format.toggle()
end, { desc = "Toggle Auto Format (Global)" })
map("n", "<leader>uF", function()
    LazyVim.format.toggle(true)
end, { desc = "Toggle Auto Format (Buffer)" })
map("n", "<leader>us", function()
    LazyVim.toggle("spell")
end, { desc = "Toggle Spelling" })
map("n", "<leader>uw", function()
    LazyVim.toggle("wrap")
end, { desc = "Toggle Word Wrap" })
map("n", "<leader>uL", function()
    LazyVim.toggle("relativenumber")
end, { desc = "Toggle Relative Line Numbers" })
map("n", "<leader>ul", function()
    LazyVim.toggle.number()
end, { desc = "Toggle Line Numbers" })
map("n", "<leader>ud", function()
    LazyVim.toggle.diagnostics()
end, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map("n", "<leader>uc", function()
    LazyVim.toggle("conceallevel", false, { 0, conceallevel })
end, { desc = "Toggle Conceal" })
if vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint then
    map("n", "<leader>uh", function()
        LazyVim.toggle.inlay_hints()
    end, { desc = "Toggle Inlay Hints" })
end
map("n", "<leader>uT", function()
    if vim.b.ts_highlight then
        vim.treesitter.stop()
    else
        vim.treesitter.start()
    end
end, { desc = "Toggle Treesitter Highlight" })
map("n", "<leader>ub", function()
    LazyVim.toggle("background", false, { "light", "dark" })
end, { desc = "Toggle Background" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

-- LazyVim Changelog
map("n", "<leader>L", function()
    LazyVim.news.changelog()
end, { desc = "LazyVim Changelog" })

-- floating terminal
local lazyterm = function()
    LazyVim.terminal(nil, { cwd = LazyVim.root() })
end
map("n", "<leader>ft", lazyterm, { desc = "Terminal (Root Dir)" })
map("n", "<leader>fT", function()
    LazyVim.terminal()
end, { desc = "Terminal (cwd)" })
map("n", "<c-/>", lazyterm, { desc = "Terminal (Root Dir)" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wm", function()
    LazyVim.toggle.maximize()
end, { desc = "Maximize Toggle" })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
