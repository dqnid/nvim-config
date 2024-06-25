-- UNUSED BUT KEPT AS AN EXAMPLE

local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
    on_attach = M.on_attach,
    capabilities = M.capabilities,

    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

lspconfig.cssmodules_ls.setup({
    -- provide your on_attach to bind keymappings
    on_attach = M.on_attach,
    -- optionally
    init_options = {
        camelCase = "dashes",
    },
})

local vue_language_server_path = "/usr/bin/vue-language-server"

lspconfig.tsserver.setup({
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vue_language_server_path,
                languages = { "vue" },
            },
        },
    },
    filetypes = { "vue" },
})
-- lspconfig.vuels.setup({})
lspconfig.volar.setup({})

return M
