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

	vim.keymap.set("n", "<Leader>gd", function() vim.lsp.buf.definition() end, opts)
	--[[
	vim.keymap.set("n", "<Leader>k", function() vim.lsp.buf.signature_help() end, opts)
	vim.keymap.set("n", "<Leader>kg", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "<Leader>kn", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "<Leader>kN", function() vim.diagnostic.goto_prev() end, opts)
	]]

end)

local opts2 = { noremap = true, silent = false }
vim.api.nvim_set_keymap("n", "<Leader>gg", "<cmd>lua vim.diagnostic.open_float()<CR>", opts2)
vim.api.nvim_set_keymap("n", "<Leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts2)
vim.api.nvim_set_keymap("n", "<Leader>gN", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts2)
vim.api.nvim_set_keymap("n", "<Leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts2)

--"https://github.com/neovim/nvim-lspconfig"
--"https://github.com/ThePrimeagen/init.lua/blob/master/after/plugin/lsp.lua"

--[[
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


]]
