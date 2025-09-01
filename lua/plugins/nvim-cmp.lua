-- "https://github.com/hrsh7th/nvim-cmp"
-- default config with some mods

--[[

	NOTE TO SELF PLEASE READ THIS PLEASE READ THIS PLEASE READ THIS PLEASE READ THIS PLEASE READ THIS PLEASE READ THIS

	as of Monday, April 1, 2024, 5:12:21PM:
		finally fixed an issue of <Tab> not working in insert mode
		I did about... I wanna say 58 minutes of debugging
			(since I logged on today, with the output of "uptime" command being: "17:13:08 up 58 min,  1 user,  load average: 0.56, 0.47, 0.40")

		this was sort of a stroke of luck figuring this one out. I remembered that in regular vim, today, while I was playing around at school,
			(thank you "https://codedamn.com/online-compiler/bash" btw, cuz the school blocks crap for no reason)
		"^I" is what is displayed for <Tab> when doing ":set list", and I remembered while debugging today that in "^I", the "^" symbol is typically
		used as an escape character of sorts (maybe not semantically but ye), to show in some sort of shell that you hit "ctrl" + "[insert keystroke here]"
			(try "ctrl + l" in insert mode, as typically "ctrl + l" isn't mapped in vim/nvim ... should print '^L' as one character)
		
		...

		this is what was causing the issue. I happened to have "<C-i>" mapped to "cmd.mapping.open_docs()", and as I've explained, "ctrl" + "[insert keystroke here]"
		produces the output of "^[insert keystroke here]". In my case, mapping "<C-i>", was redirecting any "<Tab>" characters to do whatever "<C-i>" was mapped to,
		as again, "<C-i>" produces "^I", which is the same this as how "<Tab>" is equivalent to "^I"

		to anybody reading this... don't waste your time and keep "<C-i>" unmapped for any insert mode bindings...
	end note Monday, April 1, 2024, 5:22:48PM
]]


local cmp = require("cmp")

local mappingpreset = {
	["<C-l>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), --not having tab as select_next_item allows tab to work for / mode or search mode (also tab for : mode)
	["<C-h>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
	["<C-k>"] = cmp.mapping.scroll_docs(-1),
	["<C-j>"] = cmp.mapping.scroll_docs(1),
	["<C-u>"] = cmp.mapping.open_docs(),
	["<C-y>"] = cmp.mapping.close_docs(),
	["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	["<C-n>"] = cmp.mapping.complete(),
	["<C-m>"] = cmp.mapping.abort(),

	--"https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip"
	--[[
	["<C-n"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif require("luasnip").locally_jumpable(1) then
			require("luasnip").jump(1)
		else
			fallback()
		end
	end, { "i", "s" }),
	["<C-N"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif require("luasnip").locally_jumpable(-1) then
			require("luasnip").jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }),
	]]
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

	view = {
		-- "https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance"
		--entries = { name = "wildmenu", separator = "|", selection_order = "near_cursor"}, -- can be "custom", "wildmenu" or "native"
		--entries = { name = "custom", selection_order = "near_cursor"}, -- can be "custom", "wildmenu" or "native"
		entries = { name = "custom", selection_order = "top_down"}, -- can be "custom", "wildmenu" or "native"
	},

	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
		documentation = {
			max_width = 80,
			max_height = 30
		}
	},

	mapping = cmp.mapping.preset.insert(mappingpreset),

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- { name = 'vsnip' }, -- For vsnip users.
		-- { name = "luasnip", option = { use_show_condition = false, show_autosnippets = true } }, -- For luasnip users.
		{ name = "luasnip" }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
		--{ name = "buffer" },
		--{ name = "calc" },
		{ name = "nvim_lsp_signature_help"}
	}),

	preselect = cmp.PreselectMode.None
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
		{ name = "buffer" }
	})
})

cmp.setup.filetype("text", {
	sources = cmp.config.sources({
		{ name = "luasnip" }, -- For luasnip users.
		{ name = "buffer" },
		{
			name = "buffer-lines", --"https://github.com/amarakon/nvim-cmp-buffer-lines"
			option = {
				words = true,
				comments = false,
				line_number = false,
				line_number_separator = " ",
				leading_whitespace = true,
				max_indents = 0,
				max_size = 1024 -- (1024KiB is 1MiB) max size in kB for which this plugin will load
			}
		},
		-- { name = "spell", option = { keep_all_entries = false, enable_in_context = function() return true end } }, --make sure "vim.opt.spell = true" and "vim.opt.spelllang = { "en_US" }"
		{ name = "calc" },
		--{ name = "emoji", option = { insert = true } },
		--{ name = "rpncalc" },
	})
})

cmp.setup.filetype("zsh", {
	sources = cmp.config.sources({
		{ name = "buffer" },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(mappingpreset),
	--mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(mappingpreset),
	--mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "cmdline" }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})
