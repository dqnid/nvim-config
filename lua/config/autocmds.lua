-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Automatic format with conform on every save (moved to plugin config)
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = "*",
--     callback = function(args)
--         require("conform").format({ bufnr = args.buf })
--     end,
-- })
-- Refresh lualine
vim.api.nvim_create_autocmd("ModeChanged", {
    callback = function(opts)
        require("lualine").refresh()
    end,
})
vim.api.nvim_create_autocmd("CursorMoved", {
    callback = function(opts)
        require("lualine").refresh()
    end,
})
