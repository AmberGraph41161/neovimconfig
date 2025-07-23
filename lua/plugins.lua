-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
	
	---| TELESCOPE |---
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		--branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	---| COLORS |---
	{ "agude/vim-eldar" },
	{ "tomasr/molokai" },
	{ "jordst/colorscheme" },
	{ "folke/tokyonight.nvim" },
	{ "catppuccin/nvim" },
	{ "craftzdog/solarized-osaka.nvim" },
	{ "NLKNguyen/papercolor-theme" },
	{ "miikanissi/modus-themes.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "bluz71/vim-nightfly-colors" },
	{ "bluz71/vim-moonfly-colors" },
	{ "iagorrr/noctis-high-contrast.nvim" },

	---| BLING |---
	{ "norcalli/nvim-colorizer.lua" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" }
	},

	---| LSP STUFF |---
	-- main
	{ "williamboman/mason.nvim" }, -- manage lsp servers
	{ "williamboman/mason-lspconfig.nvim" }, -- stuff like "ensure installed" for lsp
	{ "neovim/nvim-lspconfig" }, -- make nvimlsp setup easier (no hassle)

	-- snippets
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp"
	},
	{ "saadparwaiz1/cmp_luasnip" }, -- bridges custom snippets to nvim-cmp

	-- autocomplete
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-cmdline" }, -- needs cmp-buffer
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-nvim-lsp" }, -- bridge nvim-cmp with lsp stuff
	{ "hrsh7th/cmp-nvim-lsp-signature-help" }, -- helps with seeing overloaded funtion definitions and stuff

	{ "amarakon/nvim-cmp-buffer-lines" },
	{ "hrsh7th/cmp-calc" },
	{ "f3fora/cmp-spell" },
	--{ "hrsh7th/cmp-emoji" },
	--{ "rasulomaroff/cmp-bufname" },
	--{ "PhilRunninger/cmp-rpncalc" },
	--{ "dmitmel/cmp-digraphs" },
	--{ "hrsh7th/cmp-omni" },

	-- better syntax highlighting stuff yeaaaa
	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'master',
		lazy = false,
		build = ":TSUpdate"
	}
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true, notify = false },
})
