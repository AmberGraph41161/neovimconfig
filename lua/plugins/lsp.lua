---| cmp-nvim-lsp |---
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.enable('clangd', {
	capabilities = capabilities,
})

vim.lsp.enable('lua_ls', {
	capabilities = capabilities,
})

vim.lsp.enable('neocmake', {
	capabilities = capabilities,
})

vim.lsp.enable('jdtls', {
	capabilities = capabilities,
})

vim.lsp.enable('basedpyright', {
	capabilities = capabilities,
})

vim.lsp.enable('ocamllsp', {
	capabilities = capabilities,
})

---| nvim-lspconfig |---
vim.keymap.set("n", "<Leader>gg", vim.diagnostic.open_float)
vim.keymap.set("n", "<Leader>gn", function() vim.diagnostic.jump({ count = 1, float = false }) end)
vim.keymap.set("n", "<Leader>gN", function() vim.diagnostic.jump({ count = -1, float = false }) end)

vim.keymap.set("n", "<Leader>gh", vim.lsp.buf.hover)
vim.keymap.set("i", "<A-h>", vim.lsp.buf.hover)
vim.keymap.set("i", "<A-u>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<Leader>gu", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.declaration)
vim.keymap.set("n", "<Leader>gD", vim.lsp.buf.definition)
vim.keymap.set("n", "<Leader>gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<Leader>ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "<Leader>gc", vim.lsp.buf.clear_references)
vim.keymap.set("n", "<Leader>gr", vim.lsp.buf.rename)
