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

