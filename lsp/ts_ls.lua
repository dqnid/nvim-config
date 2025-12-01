return {
	cmd = { 'typescript-language-server', '--stdio' },
	filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'javascriptreact', 'javascript.jsx', 'js', 'jsx', 'ts', 'tsx' },
	root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json' },
	single_file_support = false,
	workspace_required = true,
}
