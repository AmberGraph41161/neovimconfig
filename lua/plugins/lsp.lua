---| mason-lspconfig |---lsp
require("mason-lspconfig").setup {
	ensure_installed = { "clangd", "lua_ls", "cmake", "jdtls", "pylsp" },
	automatic_installation = false,
}

---| cmp-nvim-lsp |---
	-- "https://github.com/hrsh7th/cmp-nvim-lsp"
	-- default config with some mods
	-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- An example for configuring `clangd` LSP to use nvim-cmp as a completion engine
require('lspconfig').clangd.setup {
	capabilities = capabilities,
}

require('lspconfig').lua_ls.setup {
	capabilities = capabilities,
}

require('lspconfig').cmake.setup {
	capabilities = capabilities,
}

require('lspconfig').jdtls.setup {
	capabilities = capabilities,
}

require('lspconfig').pylsp.setup {
	capabilities = capabilities,
}

---| nvim-lspconfig |---
	--[[ :LspInfo shows the status of active and configured language servers.
	:LspStart <config_name> Start the requested server name. Will only successfully start if the command detects a root directory matching the current config. Pass autostart = false to your .setup{} call for a language server if you would like to launch clients solely with this command. Defaults to all servers matching current buffer filetype.
	:LspStop <client_id> Defaults to stopping all buffer clients.
	:LspRestart <client_id> Defaults to restarting all buffer clients.
	]]

	-- "https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md"

vim.keymap.set("n", "<Leader>gg", vim.diagnostic.open_float)
vim.keymap.set("n", "<Leader>gn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<Leader>gN", vim.diagnostic.goto_prev)

-- note that 'K' is mapped to vim.lsp.buf.hover() unless 'keywordprg' is customized or a custom keymap for K exists. "https://neovim.io/doc/user/lsp.html"
vim.keymap.set("n", "<Leader>gh", vim.lsp.buf.hover)
vim.keymap.set("i", "<A-u>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<Leader>gu", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.declaration)
vim.keymap.set("n", "<Leader>gD", vim.lsp.buf.definition)
vim.keymap.set("n", "<Leader>gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<Leader>ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "<Leader>gc", vim.lsp.buf.clear_references)
vim.keymap.set("n", "<Leader>gr", vim.lsp.buf.rename)

--vim.keymap.set("n", "<Leader>gh", vim.lsp.buf.hover, { buffer = 0 })
--vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, { buffer = 0 })
--vim.keymap.set("n", "<Leader>gD", vim.lsp.buf.declaration, { buffer = 0 })
--vim.keymap.set("n", "<Leader>gi", vim.lsp.buf.implementation, { buffer = 0 })
--vim.keymap.set("n", "<Leader>ga", vim.lsp.buf.code_action, { buffer = 0 })
--vim.keymap.set("n", "<Leader>gc", vim.lsp.buf.clear_references, { buffer = 0 })

--vim.keymap.set("n", "<Leader>gh", vim.lsp.buf.hover, { buffer = 0 })
--vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, { buffer = 0 })
--vim.keymap.set("n", "<Leader>gD", vim.lsp.buf.declaration, { buffer = 0 })
--vim.keymap.set("n", "<Leader>gi", vim.lsp.buf.implementation, { buffer = 0 })
--vim.keymap.set("n", "<Leader>ga", vim.lsp.buf.code_action, { buffer = 0 })

--vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = 0 })
--vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--vim.keymap.set('n', '<space>wl', function()
--vim.inspect(vim.lsp.buf.list_workspace_folders()))
--vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--vim.lsp.buf.clear_references()
--vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
--vim.keymap.set('n, '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
