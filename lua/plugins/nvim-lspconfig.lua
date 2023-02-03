-- ensure lsp's are installed
local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.ensure_installed({
	"clangd",
	"cmake-language-server",
	"cmakelang",
	"lua-language-server",
})

-- setup lsp's
require("lspconfig").clangd.setup{}

-- lsp keybinds
lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "<Leader>e", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)
