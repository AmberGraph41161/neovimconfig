---| INVISIBLE CHARS AND STUFF |---
vim.opt.list = true -- will make trailing spaces show (TOGGLE KEYBINDS)
vim.opt.listchars =
{
	eol = "",
	trail = "ﲗ",
	tab = " ",
}


---| THE MOUSE MAKES YOU SLOW |---
vim.opt.mouse = ""

---| CURSOR/LINE PROPERTIES |---
vim.opt.wrap = false
vim.opt.number = true -- on by default (TOGGLE KEYBINDS)
vim.opt.relativenumber = true -- on by default (TOGGLE KEYBINDS)
vim.opt.cursorline = true -- cursorline on by default (TOGGLE KEYBINDS)
vim.opt.cursorcolumn = true -- cursorcolumn on by default (TOGGLE KEYBINDS)
vim.opt.cursorlineopt = "line" -- "line", "screenline", "number", "both" (line,number), (line and screenline cannot be used together)
vim.opt.scroll = 8
vim.opt.ruler = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 20
-- vim.opt.startofline = true
vim.opt.scroll = 10

---| TABS OR SPACES? LOL |---
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.expandtab = false -- do not turn tabs into spaces

---| HIGHLIGHT |---
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false -- highlight search off by default (TOGGLE KEYBINDS)
vim.opt.spell = false -- spell check off

---| AUTOCOMPLETE STUFF |---
vim.opt.completeopt = menu, preview
vim.opt.pumheight = 20 -- popup menu height
vim.opt.pumwidth = 30 -- popup menu width

---| WINDOW TABS |---
vim.opt.showtabline = 1 -- 0:never, 1:only if there are at leset two tab pages, 2: always
vim.opt.tabpagemax = 15
vim.opt.tabline = "" -- man this is complicated. will just leave as default cuz this is too much hassle. Thursday, March 28, 2024, 7:21:39PM


---| TERMINAL |---
vim.opt.shell ="/bin/zsh"
vim.opt.title = true
vim.opt.titlelen = 50
vim.opt.titlestring = "| ~^_^~ ~^_^~ | NEOVIM | ~^_^~ ~^_^~ |"
vim.opt.titleold = "| ~^_^~ ~^_^~ | CLOSING NEOVIM | ~^_^~ ~^_^~ |"
vim.opt.icon = true
vim.opt.iconstring = "| I LOVE NEOVIM! |"

---| BACKUP FILE OPTIONS |---
--vim.opt.backup = false
