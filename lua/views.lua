---| invisible chars and stuff |---
vim.opt.list = true -- will make trailing spaces show (TOGGLE KEYBINDS)
vim.opt.listchars =
{
	eol = "",
	trail = "ﲗ",
	tab = " ",
}

---| line/cursor properties |---
vim.opt.wrap = false
vim.opt.relativenumber = true -- on by default (TOGGLE KEYBINDS)
vim.opt.number = true -- on by default (TOGGLE KEYBINDS)
vim.opt.cursorline = true -- cursorline on by default (TOGGLE KEYBINDS)
vim.opt.cursorcolumn = true -- cursorcolumn on by default (TOGGLE KEYBINDS)
vim.opt.scroll = 8
vim.opt.ruler = true

---| tabs or spaces? LOL |---
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.expandtab = false -- do not turn tabs into spaces

---| highlight |---
vim.opt.hlsearch = false -- highlight search off by default (TOGGLE KEYBINDS)
vim.opt.spell = false -- spell check off

---| autocomplete stuff |---
vim.opt.completeopt = menu, preview
vim.opt.pumheight = 20 -- popup menu height
vim.opt.pumwidth = 30 -- popup menu width

---| window tabs |---
