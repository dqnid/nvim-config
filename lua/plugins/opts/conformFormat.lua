local config = {
    -- Define your formatters
    formatters_by_ft = {
        rust = { "rustfmt" },
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        javascript = { "prettierd", "prettier", "biome", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", "biome", stop_after_first = true },
        typescript = { "prettierd", "prettier", "biome", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", "biome", stop_after_first = true },
        css = { "prettierd", "prettier", "biome", stop_after_first = true },
        scss = { "prettierd", "prettier", "biome", stop_after_first = true },
        -- python = function(bufnr)
        --     if require("conform").get_formatter_info("ruff_format", bufnr).available then
        --         return { "ruff_format" }
        --     else
        --         return { "isort", "black" }
        --     end
        -- end,
        ["_"] = { "trim_whitespace" }, -- run only on filetypes without formater
        -- ["*"] = { "trim_whitespace" }, -- run in all filetypes
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
    -- Customize formatters
    formatters = {
        shfmt = {
            prepend_args = { "-i", "2" },
        },
    },
}

return config
