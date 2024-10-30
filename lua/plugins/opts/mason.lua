local options = {
    ensure_installed = {
        "stylua",
        "shfmt",
        -- "lua-language-server lua_ls",
        "clang-format",
        "clangd",
        -- "css-lsp cssls",
        "deno",
        "emmet-language-server",
        "flake8",
        "html-lsp",
        "json-lsp",
        "prettier",
        "pyright",
        "shellcheck",
        "typescript-language-server",
        "deno",
        "vtsls",
        "vue-language-server",
        "rust-analyzer",
        --"rustfmt", -- better installed via "$ rustup component add rustfmt"
    }, -- not an option from mason.nvim

    ui = {
        icons = {
            package_pending = " ",
            package_installed = "󰄳 ",
            package_uninstalled = " 󰚌",
        },

        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            check_server_version = "c",
            update_all_servers = "U",
            check_outdated_servers = "C",
            uninstall_server = "X",
            cancel_installation = "<C-c>",
        },
    },

    max_concurrent_installers = 10,
}

return options
