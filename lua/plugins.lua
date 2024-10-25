--[[
-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- Regenerate compiled loader file
:PackerCompile

-- Remove any disabled or unused plugins
:PackerClean

-- Clean, then install missing plugins
:PackerInstall

-- Clean, then update and install plugins
-- supports the `--preview` flag as an optional first argument to preview updates
:PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
-- supports the `--preview` flag as an optional first argument to preview updates
:PackerSync

-- Show list of installed plugins
:PackerStatus

-- Loads opt plugin immediately
:PackerLoad completion-nvim ale
]]--


local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

-------------------------------------------------------------------------------------------------------------------------

	---| CD WITH SPEED |---
	-- fuzzy finder
	use
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.5",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	-- tree file viewer. kinda pointless, might remove idk
	use
	{
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		-- tag = "nightly" -- optional, updated every week
	}

	---| COLORS |---
	use "agude/vim-eldar"
	use "tomasr/molokai"
	use "jordst/colorscheme"
	use "folke/tokyonight.nvim"
	use "catppuccin/nvim"
	use "craftzdog/solarized-osaka.nvim"
	use "NLKNguyen/papercolor-theme"
	use "miikanissi/modus-themes.nvim"
	use "rebelot/kanagawa.nvim"
	use "bluz71/vim-nightfly-colors"
	use "bluz71/vim-moonfly-colors"
	use "iagorrr/noctis-high-contrast.nvim"

	---| BLING |---
	use "norcalli/nvim-colorizer.lua"
	use
	{
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true }
	}

	---| LSP STUFF |---
	-- main
	use "williamboman/mason.nvim" -- manage lsp servers
	use "williamboman/mason-lspconfig.nvim" -- stuff like "ensure installed" for lsp
	use "neovim/nvim-lspconfig" -- make nvimlsp setup easier (no hassle)

	-- snippets
	use
	{
		"L3MON4D3/LuaSnip",
		tag = "v2.*",
		run = "make install_jsregexp"
	}
	use "saadparwaiz1/cmp_luasnip" -- bridges custom snippets to nvim-cmp

	-- autocomplete
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-cmdline" -- needs cmp-buffer
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-nvim-lsp" -- bridge nvim-cmp with lsp stuff
	use "hrsh7th/cmp-nvim-lsp-signature-help" -- helps with seeing overloaded funtion definitions and stuff

	use "amarakon/nvim-cmp-buffer-lines"
	use "hrsh7th/cmp-calc"
	use "f3fora/cmp-spell"
	--use "hrsh7th/cmp-emoji"
	--use "rasulomaroff/cmp-bufname"
	--use "PhilRunninger/cmp-rpncalc"
	--use "dmitmel/cmp-digraphs"
	--use "hrsh7th/cmp-omni"

	-- better syntax highlighting stuff yeaaaa
	use -- "https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation"
	{
		"nvim-treesitter/nvim-treesitter",
		--run = ":TSUpdate"

		run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
	}


-------------------------------------------------------------------------------------------------------------------------

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
