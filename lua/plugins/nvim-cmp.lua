local cmp = require("cmp")

local mappingpreset = {
	["<C-l>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), --not having tab as select_next_item allows tab to work for / mode or search mode (also tab for : mode)
	["<C-h>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
	["<C-k>"] = cmp.mapping.scroll_docs(-1),
	["<C-j>"] = cmp.mapping.scroll_docs(1),
	["<C-u>"] = cmp.mapping.open_docs(),
	["<C-y>"] = cmp.mapping.close_docs(),
	["<CR>"] = cmp.mapping.confirm({ select = false }), --Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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

local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

local cmp_kinds = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}

cmp.setup({
	snippet = {
		--REQUIRED - you must specify a snippet engine
		expand = function(args)
		--vim.fn["vsnip#anonymous"](args.body) --For `vsnip` users.
		require("luasnip").lsp_expand(args.body) --For `luasnip` users.
		--require('snippy').expand_snippet(args.body) --For `snippy` users.
		--vim.fn["UltiSnips#Anon"](args.body) --For `ultisnips` users.
		--vim.snippet.expand(args.body) --For native neovim snippets (Neovim v0.10+)
	  end,
	},

	view = {
		--"https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance"
		--entries = { name = "wildmenu", separator = "|", selection_order = "near_cursor"}, --can be "custom", "wildmenu" or "native"
		--entries = { name = "custom", selection_order = "near_cursor"}, --can be "custom", "wildmenu" or "native"
		entries = { name = "custom", selection_order = "top_down"}, --can be "custom", "wildmenu" or "native"
	},

	window = {
		--completion = cmp.config.window.bordered(),
		--documentation = cmp.config.window.bordered(),
		documentation = {
			max_width = 80,
			max_height = 30
		}
	},

	formatting = {
		format = function(entry, vim_item)
			--https://github.com/hrsh7th/nvim-cmp/issues/88
			--https://github.com/hrsh7th/nvim-cmp/issues/980
			--local truncatedAbbr = string.sub(vim_item.abbr, 1, 100)
			--local truncatedAbbr = string.sub(vim_item.abbr, 1, vim.api.nvim_win_get_width(0) / 2)
			local truncatedAbbr = string.sub(vim_item.abbr, 1, vim.o.columns / 2)
			if truncatedAbbr ~= vim_item.abbr then
				vim_item.abbr = truncatedAbbr .. "  …"
			end
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]"
			})[entry.source.name]
			return vim_item
		end
	},

	mapping = cmp.mapping.preset.insert(mappingpreset),

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		--{ name = 'vsnip' }, --For vsnip users.
		--{ name = "luasnip", option = { use_show_condition = false, show_autosnippets = true } }, --For luasnip users.
		{ name = "luasnip" }, --For luasnip users.
		--{ name = 'ultisnips' }, --For ultisnips users.
		--{ name = 'snippy' }, --For snippy users.
		--{ name = "buffer" },
		--{ name = "calc" },
		{ name = "nvim_lsp_signature_help"}
	}),

	preselect = cmp.PreselectMode.None
})

--Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" }, --You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
		{ name = "buffer" }
	})
})

cmp.setup.filetype("text", {
	sources = cmp.config.sources({
		{ name = "luasnip" }, --For luasnip users.
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
				max_size = 1024 --(1024KiB is 1MiB) max size in kB for which this plugin will load
			}
		},
		--{ name = "spell", option = { keep_all_entries = false, enable_in_context = function() return true end } }, --make sure "vim.opt.spell = true" and "vim.opt.spelllang = { "en_US" }"
		{ name = "calc" },
		--{ name = "emoji", option = { insert = true } },
		--{ name = "rpncalc" },
	})
})

--Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(mappingpreset),
	--mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" }
	}
})

--Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(mappingpreset),
	--mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "cmdline" }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})
