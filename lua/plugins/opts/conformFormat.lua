local config = {
    -- Define your formatters
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        javascript = { { "prettierd", "prettier" } },
        python = function(bufnr)
            if require("conform").get_formatter_info("ruff_format", bufnr).available then
                return { "ruff_format" }
            else
                return { "isort", "black" }
            end
        end,
        ["*"] = { "codespell" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = { "trim_whitespace" },
    },
    -- Set up format-on-save, commented since LazyVim will auto enable it
    -- format_on_save = { timeout_ms = 500, lsp_format = "fallback" },

    -- If this is set, Conform will run the formatter asynchronously after save.
    -- It will pass the table to conform.format().
    -- This can also be a function that returns the table.
    -- format_after_save = {
    --     lsp_format = "fallback",
    -- },
    -- Customize formatters
    formatters = {
        shfmt = {
            prepend_args = { "-i", "2" },
        },
    },
}

return config
