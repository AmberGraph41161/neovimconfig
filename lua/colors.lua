--vim.opt.syntax = cpp
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.colorscheme("molokai")
--vim.cmd.colorscheme("noctishc")
--vim.cmd.colorscheme("nightfly")
--vim.cmd.colorscheme("moonfly")
--vim.cmd.colorscheme("tokyonight-night")
--vim.cmd.colorscheme("kanagawa-dragon")
--vim.cmd.colorscheme("lunaperche")
--vim.cmd.colorscheme("elflord")

-- "https://github.com/rebelot/kanagawa.nvim" ...? too much setup tho... kind of idk

--[[
function bruh(color) -- "https://www.youtube.com/watch?v=w7i4amO_zaE" thank you prime sir
	color = color or "elflord"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
]]
