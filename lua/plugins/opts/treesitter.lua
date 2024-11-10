local options = {
    auto_install = true,
    ensure_installed = {
        "lua",
        "css",
        "scss",
        "html",
        "json",
        "tsx",
        "bash",
        "javascript",
        "json",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "typescript",
        "styled",
        "vim",
        "yaml",
        "rust",
        "ruby",
        "c",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = { "html", "xml", "jsx", "tsx" },
    },

    indent = { enable = true },
}

return options
