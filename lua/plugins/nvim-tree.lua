-- to disable netrw at the start of init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	sort_by = "case_sensitive",

	view = {
		width = 30,
	},

	renderer = {
		group_empty = true,
	},

	filters = {
		dotfiles = false,
	},
})

---| nvim-tree keybinds |---
vim.keymap.set("n", "<Leader>ef", ":NvimTreeToggle<CR>", { silent = true }) -- toggle nvim tree
vim.keymap.set("n", "<Leader>ee", ":NvimTreeToggle .<CR>", { silent = true }) -- reset nvim tree root view
vim.keymap.set("n", "<Leader>er", ":NvimTreeCollapse<CR>", { silent = true }) -- collapse all folders in nvim tree


--[[

:NvimTreeToggle Open or close the tree. Takes an optional path argument.

:NvimTreeFocus Open the tree if it is closed, and then focus on the tree.

:NvimTreeFindFile Move the cursor in the tree for the current buffer, opening folders if needed.

:NvimTreeCollapse Collapses the nvim-tree recursively.
]]--
