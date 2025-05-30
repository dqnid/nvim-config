return {
    cmd = { 'astro-ls', '--stdio' },
    filetypes = { 'astro' },
    root_markers = { 'astro.config.mjs', 'astro.config.js', 'astro.config.ts' },
    init_options = {
         typescript = { tsdk = "./node_modules/typescript/lib" }
    }
}
