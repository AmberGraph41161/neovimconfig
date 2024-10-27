vim.g.mapleader = " " -- LEADER KEYYYYYYYYYYY

--legacy stuff for reference Saturday, October 26, 2024, 23:43:04
	--vim.api.nvim_set_keymap

---| I like having my cursor centered on the screen ok? Leave me alone >:( |---
vim.keymap.set("n", "{", "{zz", { silent = false }) -- center screen after shift-{
vim.keymap.set("n", "}", "}zz", { silent = false }) -- center screen after shift-}
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = false }) -- center screen after ctrl-d
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = false }) -- center screen after ctrl-u

---| KEYBINDS |---
vim.keymap.set("n", "<C-z>", ":wq", { silent = false }) -- makes sure I don't accidentally fat finger and forcequit vim
vim.keymap.set("n", "<C-s>", ":w<Enter>", { silent = false }) -- save file on ctrl-s
vim.keymap.set("i", "<C-s>", "<Escape>:w<Enter>", { silent = false }) -- save file on ctrl-s
vim.keymap.set("n", "<A-s>", ":mks! session.vim", { silent = false}) -- save session on alt-s
vim.keymap.set("i", "<A-s>", "<Escape>:mks! session.vim", { silent = false}) -- save session on alt-s
vim.keymap.set("n", "<C-a>", "gg^vG$", { silent = false }) -- select all on ctrl-a
vim.keymap.set("n", "=", "<C-a>", { noremap = true, silent = false }) -- increment numbers
vim.keymap.set("n", "-", "<C-x>", { noremap = true, silent = false }) -- decrement numbers
vim.keymap.set("n", "n", "nzz", { silent = false }) -- center screen when going to next search result
vim.keymap.set("n", "N", "Nzz", { silent = false }) -- center screen when going to previous search result
vim.keymap.set("n", "<C-r>", "R", { noremap = true, silent = false }) -- swap ctrl-r with r (swap undo with replacemode)
vim.keymap.set("n", "R", "<C-r>", { noremap = true, silent = false }) -- swap r with ctrl-r (swap replacemode with undo)
vim.keymap.set("n", "U", "u", { noremap = true, silent = false }) -- U and u are synonymous now
--vim.keymap.set("i", "<C-BS>", "<Escape>dBi", {noremap = true, silent = false})

---| toggle settings |---
-- deprecated as of Wednesday, August 14, 2024, 15:35:07, I am better at nvim now
--vim.keymap.set("n", "<A-O>", ":set hls<CR>", { silent = true }) -- highlight search
--vim.keymap.set("n", "<A-P>", ":set nohls<CR>", { silent = true }) -- don't highlight search
--vim.keymap.set("n", "<A-K>", ":set list<CR>", { silent = true }) -- show invisible chars
--vim.keymap.set("n", "<A-L>", ":set nolist<CR>", { silent = true }) -- don't show invisible chars
--vim.keymap.set("n", "<A-{>", ":set cul<CR>", { silent = true }) -- show cursor line
--vim.keymap.set("n", "<A-}>", ":set nocul<CR>", { silent = true }) -- don't show cursor line
--vim.keymap.set("n", "<A-:>", ":set cuc<CR>", { silent = true }) -- show cursor column
--vim.keymap.set("n", "<A-\">", ":set nocuc<CR>", { silent = true }) -- don't show cursor column
--vim.keymap.set("n", "<A-N>", ":set rnu<CR>", { silent = true }) -- show relativenumbers
--vim.keymap.set("n", "<A-M>", ":set nornu<CR>", { silent = true }) -- don't show relativenumbers
--vim.keymap.set("n", "<A-V>", ":set nu<CR>", { silent = true }) -- show line numbers
--vim.keymap.set("n", "<A-B>", ":set nonu<CR>", { silent = true }) -- don't show line numbers
--vim.keymap.set("n", "<A-A>", ":set spell<CR>", { silent = true }) -- spellcheck on
--vim.keymap.set("n", "<A-S>", ":set nospell<CR>", { silent = true }) -- spellcheck off
--vim.keymap.set("n", "<A-Z>", ":set wrap<CR>:set spell<CR>:set nocul<CR>:set nocuc<CR>", { silent = true }) -- DOCUMENT MODE
--vim.keymap.set("n", "<A-X>", ":set nowrap<CR>:set nospell<CR>:set cul<CR>:set cuc<CR>", { silent = true }) -- CODE MODE

---| SPLIT WINDOWS |---
vim.keymap.set("n", "<A-u>", ":split<CR>", { silent = true }) -- top to bottom split
vim.keymap.set("n", "<A-i>", ":vsplit<CR>", { silent = true }) -- left to right split
--vim.keymap.set("n", "<A-Y>", "<C-W>n", { silent = true }) -- create new empty window left to right
vim.keymap.set("n", "<A-k>", "<C-W>k", { noremap = true, silent = false }) -- tab over UP
vim.keymap.set("n", "<A-j>", "<C-W>j", { noremap = true, silent = false }) -- tab over DOWN
vim.keymap.set("n", "<A-h>", "<C-W>h", { noremap = true, silent = false }) -- tab over LEFT
vim.keymap.set("n", "<A-l>", "<C-W>l", { noremap = true, silent = false }) -- tab over RIGHT
--vim.keymap.set("n", "<C-Up>", ":resize +1<CR>", { silent = false }) -- resize UP
--vim.keymap.set("n", "<C-Down>", ":resize -1<CR>", { silent = false }) -- resize DOWN
--vim.keymap.set("n", "<C-Left>", ":vertical resize +1<CR>", { silent = false }) -- resize LEFT
--vim.keymap.set("n", "<C-Right>", ":vertical resize -1<CR>", { silent = false }) -- resize RIGHT
vim.keymap.set("n", "<A-K>", ":resize +1<CR>", { silent = false }) -- resize UP
vim.keymap.set("n", "<A-J>", ":resize -1<CR>", { silent = false }) -- resize DOWN
vim.keymap.set("n", "<A-H>", ":vertical resize +1<CR>", { silent = false }) -- resize LEFT
vim.keymap.set("n", "<A-L>", ":vertical resize -1<CR>", { silent = false }) -- resize RIGHT
vim.keymap.set("n", "<A-y>", "<C-W>w", { silent = false }) -- switch to next window
vim.keymap.set("n", "<A-Y>", "<C-W>W", { silent = false }) -- switch to prev window
vim.keymap.set("n", "<A-n>", "<C-W>q", { silent = false }) -- quit current window
vim.keymap.set("n", "<A-t>", "<C-W>=", { silent = false }) -- make all windows equal size
vim.keymap.set("n", "<A-r>", "<C-w>r", { silent = false}) -- rotate windows

---| WINDOW TABS |---
-- normal mode
vim.keymap.set("n", "<A-Down>", ":tabnew<CR>", { silent = true }) -- create new tab
vim.keymap.set("n", "<A-Right>", "gt", { silent = true }) -- go forward one tab
vim.keymap.set("n", "<A-Left>", "gT", { silent = true }) -- go backwards one tab
vim.keymap.set("n", "<A-Up>", ":tabc<CR>", { silent = true }) -- close current tab
vim.keymap.set("n", "<A-S-Up>", ":tabo<CR>", { silent = true }) -- close all tabs except current one
-- insert mode
vim.keymap.set("i", "<A-Down>", "<Escape>:tabnew<CR>a", { silent = true }) -- create new tab
vim.keymap.set("i", "<A-Right>", "<Escape>gta", { silent = true }) -- go forward one tab
vim.keymap.set("i", "<A-Left>", "<Escape>gTa", { silent = true }) -- go backwards one tab
vim.keymap.set("i", "<A-Up>", "<Escape>:tabc<CR>a", { silent = true }) -- close current tab
vim.keymap.set("i", "<A-S-Up>", "<Escape>:tabo<CR>a", { silent = true }) -- close all tabs except current one

---| CLIPBOARD |---
-- "https://discourse.nixos.org/t/how-to-support-clipboard-for-neovim/9534/2"
-- "If you are using Linux, you need to install xclip if using X11 or wl-copy and wl-paste if using Wayland."
-- "sudo pacman -S xclip"
vim.keymap.set("v", "<Leader>Y", "\"*Y", { silent = true }) -- yank selected to primary clipboard (copy on select with middle mouse button)
vim.keymap.set("n", "<Leader>P", "\"*P", { silent = true }) -- paste from primary clipboard (copy on select with middle mouse button)
vim.keymap.set("v", "<Leader>y", "\"+y", { silent = true }) -- yank selected to system clipboard
vim.keymap.set("n", "<Leader>p", "\"+p", { silent = true }) -- paste from system clipboard

---| DATE/TIME |---
function GETDATEX11() -- only works for x11 cuz xclip shenanigans
	os.execute("date '+%A, %B %d, %Y, %T' | xclip -selection clipboard")
	print("date copied to system clipboard")
end

function GETDATEWAYLAND() -- only works for wayland cuz wl-clipboard shenanigans
	os.execute("date '+%A, %B %d, %Y, %T' | wl-copy")
	print("date copied to system clipboard")
end

vim.keymap.set("n", "<Leader>d", ":lua GETDATEWAYLAND()<CR>", { silent = true })
