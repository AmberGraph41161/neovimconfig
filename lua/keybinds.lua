vim.g.mapleader = " " -- LEADER KEYYYYYYYYYYY

---| I like having my cursor centered on the screen ok? Leave me alone >:( |---
vim.api.nvim_set_keymap("n", "{", "{zz", { silent = false }) -- center screen after shift-{
vim.api.nvim_set_keymap("n", "}", "}zz", { silent = false }) -- center screen after shift-}
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { silent = false }) -- center screen after ctrl-d
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { silent = false }) -- center screen after ctrl-u
	--vim.api.nvim_set_keymap("n", "k", "kzz", { silent = false }) -- change up (k) to center screen each time
	--vim.api.nvim_set_keymap("n", "j", "jzz", { silent = false }) -- change down (j) to center screen each time
	--vim.api.nvim_set_keymap("i", "<Enter>", "<Enter><Escape>zzi", { silent = false }) -- center screen after hitting the enter key in insert mode
	--vim.api.nvim_set_keymap("i", "<Delete>", "<Delete><Escape>zzi", { silent = false }) -- center screen after hitting the delete key in insert mode
	--vim.api.nvim_set_keymap("n", "<Enter>", "<Enter>zz", { silent = false }) -- center screen after hitting the enter key in insert mode

---| KEYBINDS |---
	--vim.api.nvim_set_keymap("n", ":Q!", ":q!", { silent = false }) -- FIXING Q! TYPOS
	--vim.api.nvim_set_keymap("n", ":WQ", ":wq", { silent = false }) -- FIXING WQ TYPOS
	--vim.api.nvim_set_keymap("n", ":Wq", ":wq", { silent = false }) -- FIXING WQ TYPOS
	--vim.api.nvim_set_keymap("n", ":wQ", ":wq", { silent = false }) -- FIXING WQ TYPOS
	--vim.api.nvim_set_keymap("n", ":W", ":w", { silent = false }) -- FIXING W TYPOS
	--vim.api.nvim_set_keymap("n", ":Q", ":wq", { silent = false }) -- FIXING Q TYPOS
	--vim.api.nvim_set_keymap("n", "<A-{>", "[{zz", { silent = false })
	--vim.api.nvim_set_keymap("n", "<A-}>", "[}zz", { silent = false })
vim.api.nvim_set_keymap("n", "<C-z>", ":wq", { silent = false }) -- makes sure I don't accidentally fat finger and forcequit vim
vim.api.nvim_set_keymap("n", "<C-s>", ":w<Enter>", { silent = false }) -- save file on ctrl-s
vim.api.nvim_set_keymap("i", "<C-s>", "<Escape>:w<Enter>", { silent = false }) -- save file on ctrl-s
vim.api.nvim_set_keymap("n", "<C-a>", "gg^vG$", { silent = false }) -- select all on ctrl-a
vim.api.nvim_set_keymap("n", "=", "<C-a>", { noremap = true, silent = false }) -- increment numbers
vim.api.nvim_set_keymap("n", "-", "<C-x>", { noremap = true, silent = false }) -- decrement numbers
vim.api.nvim_set_keymap("n", "n", "nzz", { silent = false }) -- center screen when going to next search result
vim.api.nvim_set_keymap("n", "N", "Nzz", { silent = false }) -- center screen when going to previous search result
vim.api.nvim_set_keymap("n", "<C-r>", "R", { noremap = true, silent = false }) -- swap ctrl-r with r (swap undo with replacemode)
vim.api.nvim_set_keymap("n", "R", "<C-r>", { noremap = true, silent = false }) -- swap r with ctrl-r (swap replacemode with undo)
vim.api.nvim_set_keymap("n", "U", "u", { noremap = true, silent = false }) -- U and u are synonymous now

---| toggle settings |---
vim.api.nvim_set_keymap("n", "<A-O>", ":set hls<CR>", { silent = true }) -- highlight search
vim.api.nvim_set_keymap("n", "<A-P>", ":set nohls<CR>", { silent = true }) -- don't highlight search
vim.api.nvim_set_keymap("n", "<A-K>", ":set list<CR>", { silent = true }) -- show invisible chars
vim.api.nvim_set_keymap("n", "<A-L>", ":set nolist<CR>", { silent = true }) -- don't show invisible chars
vim.api.nvim_set_keymap("n", "<A-{>", ":set cul<CR>", { silent = true }) -- show cursor line
vim.api.nvim_set_keymap("n", "<A-}>", ":set nocul<CR>", { silent = true }) -- don't show cursor line
vim.api.nvim_set_keymap("n", "<A-:>", ":set cuc<CR>", { silent = true }) -- show cursor column
vim.api.nvim_set_keymap("n", "<A-\">", ":set nocuc<CR>", { silent = true }) -- don't show cursor column
vim.api.nvim_set_keymap("n", "<A-N>", ":set rnu<CR>", { silent = true }) -- show relativenumbers
vim.api.nvim_set_keymap("n", "<A-M>", ":set nornu<CR>", { silent = true }) -- don't show relativenumbers
vim.api.nvim_set_keymap("n", "<A-V>", ":set nu<CR>", { silent = true }) -- show line numbers
vim.api.nvim_set_keymap("n", "<A-B>", ":set nonu<CR>", { silent = true }) -- don't show line numbers
vim.api.nvim_set_keymap("n", "<A-A>", ":set spell<CR>", { silent = true }) -- spellcheck on
vim.api.nvim_set_keymap("n", "<A-S>", ":set nospell<CR>", { silent = true }) -- spellcheck off
vim.api.nvim_set_keymap("n", "<A-Z>", ":set wrap<CR>:set spell<CR>:set nocul<CR>:set nocuc<CR>", { silent = true }) -- DOCUMENT MODE
vim.api.nvim_set_keymap("n", "<A-X>", ":set nowrap<CR>:set nospell<CR>:set cul<CR>:set cuc<CR>", { silent = true }) -- CODE MODE


---| SPLIT WINDOWS |---
vim.api.nvim_set_keymap("n", "<A-U>", ":split<CR>", { silent = true }) -- top to bottom split
vim.api.nvim_set_keymap("n", "<A-I>", ":vsplit<CR>", { silent = true }) -- left to right split
--vim.api.nvim_set_keymap("n", "<A-Y>", "<C-W>n", { silent = true }) -- create new empty window left to right
vim.api.nvim_set_keymap("n", "<C-k>", "<C-W>k", { silent = false }) -- tab over UP
vim.api.nvim_set_keymap("n", "<C-j>", "<C-W>j", { silent = false }) -- tab over DOWN
vim.api.nvim_set_keymap("n", "<C-h>", "<C-W>h", { silent = false }) -- tab over LEFT
vim.api.nvim_set_keymap("n", "<C-l>", "<C-W>l", { silent = false }) -- tab over RIGHT
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +1<CR>", { silent = false }) -- resize UP
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -1<CR>", { silent = false }) -- resize DOWN
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize +1<CR>", { silent = false }) -- resize LEFT
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize -1<CR>", { silent = false }) -- resize RIGHT
vim.api.nvim_set_keymap("n", "<A-Y>", "<C-W>w", { silent = false }) -- switch to next window
vim.api.nvim_set_keymap("n", "<A-H>", "<C-W>q", { silent = false }) -- quit current window
vim.api.nvim_set_keymap("n", "<A-T>", "<C-W>=", { silent = false }) -- make all windows equal size

---| WINDOW TABS |---
vim.api.nvim_set_keymap("n", "<A-Down>", ":tabnew<CR>", { silent = true }) -- create new tab
vim.api.nvim_set_keymap("n", "<A-Right>", "gt", { silent = true }) -- go forward one tab
vim.api.nvim_set_keymap("n", "<A-Left>", "gT", { silent = true }) -- go backwards one tab
vim.api.nvim_set_keymap("n", "<A-Up>", ":tabc<CR>", { silent = true }) -- close current tab
vim.api.nvim_set_keymap("n", "<A-S-Up>", ":tabo<CR>", { silent = true }) -- close all tabs except current one

---| CLIPBOARD |---
	-- "https://discourse.nixos.org/t/how-to-support-clipboard-for-neovim/9534/2"
	-- "If you are using Linux, you need to install xclip if using X11 or wl-copy and wl-paste if using Wayland."
	-- "sudo pacman -S xclip"
vim.api.nvim_set_keymap("v", "<Leader>Y", "\"*Y", { silent = true }) -- yank selected to primary clipboard (copy on select with middle mouse button)
vim.api.nvim_set_keymap("n", "<Leader>P", "\"*P", { silent = true }) -- paste from primary clipboard (copy on select with middle mouse button)
vim.api.nvim_set_keymap("v", "<Leader>y", "\"+y", { silent = true }) -- yank selected to system clipboard
vim.api.nvim_set_keymap("n", "<Leader>p", "\"+p", { silent = true }) -- paste from system clipboard

---| SPECIAL PASTES |---
vim.api.nvim_set_keymap("n", "<Leader>1", "i" .. -- you concatenate string with ".." in lua and not "+" for some reason...
"---[Verse:1]---<CR><Escape>xxi" ..
"---[Chorus:1]---<CR><Escape>xxi" ..
"---[Bridge:1]---<CR><Escape>xxi" ..
"---[Pre-Chorus:1]---<CR><Escape>xxi" ..
"---[Intro:1]---<CR><Escape>xxi" ..
"---[Ending:1]---<CR><Escape>xxi" ..
"---[Other:1]---<Escape>"
, { silent = false });



--[[
function map(mode, lhs, rhs, opts)
		local options = { noremap = true }
		if opts then
				options = vim.tbls_extend("force", options, opts)
		end
		vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>", ":<C-u>WhichKey ','<CR>" { silent = true })
--]]

