-- "https://github.com/hrsh7th/nvim-cmp"
-- default config with some mods

local cmp = require'cmp'

local mappingpreset = {
	["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
	["<S-Tab"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
	["<C-K>"] = cmp.mapping.scroll_docs(-1),
	["<C-J>"] = cmp.mapping.scroll_docs(1),
	["<C-l>"] = cmp.mapping.open_docs(),
	["<C-h>"] = cmp.mapping.close_docs(),
	["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	["<C-n>"] = cmp.mapping.complete(),
	["<C-m>"] = cmp.mapping.abort(),
}

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
		-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
		-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
	  end,
	},

	--[[
	view = {
		-- "https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance"
		entries = { name = "custom", selection_order = "near_cursor"}, -- can be "custom", "wildmenu" or "native"
		-- entries = { name = "wildmenu", separator = "|", selection_order = "near_cursor"}, -- can be "custom", "wildmenu" or "native"
	},
	]]

	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert(mappingpreset),

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- { name = 'vsnip' }, -- For vsnip users.
		-- { name = "luasnip", option = { use_show_condition = false, show_autosnippets = true } }, -- For luasnip users.
		{ name = "luasnip" }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	--}, {
		{ name = "buffer" },
		{ name = "buffer-lines", option = { words = false, comments = false, line_number = false, line_number_separator = " ", leading_whitespace = true, max_indents = 0, max_size = 100 } }, --"https://github.com/amarakon/nvim-cmp-buffer-lines"
		-- { name = "spell", option = { keep_all_entries = false, enable_in_context = function() return true end } }, --make sure "vim.opt.spell = true" and "vim.opt.spelllang = { "en_US" }"
		{ name = "calc" },
		--{ name = "emoji", option = { insert = true } },
		--{ name = "rpncalc" },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
		}, {
		{ name = "buffer" },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(mappingpreset),
	sources = {
		{ name = "buffer" }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(mappingpreset),
	sources = cmp.config.sources({
		{ name = "path" }
		}, {
		{ name = "cmdline" }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})
