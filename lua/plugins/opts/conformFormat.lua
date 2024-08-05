local config = {
    -- Define your formatters
    formatters_by_ft = {
        rust = { "rustfmt" },
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        python = function(bufnr)
            if require("conform").get_formatter_info("ruff_format", bufnr).available then
                return { "ruff_format" }
            else
                return { "isort", "black" }
            end
        end,
        --["*"] = { "prettierd", "prettier" }, -- run in all filetypes
        ["_"] = { "trim_whitespace" }, -- run only on filetypes without formater
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
