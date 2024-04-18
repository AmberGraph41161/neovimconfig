-- "https://github.com/L3MON4D3/LuaSnip"
---| default luasnip aliases |---
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key


---| KEYBINDS |--- broken keybinds on purpose for now, as of Sunday, April 7, 2024, 10:43:37PM
vim.keymap.set({"n"}, "<C-Q-S-B>", function() ls.expand() end, { silent = true })
vim.keymap.set({"n", "s"}, "<C-Q-B-S>", function() ls.jump( 1) end, { silent = true })
vim.keymap.set({"n", "s"}, "<C-S-A-D>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({"n", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})


---| CUSTOM SNIPPETS |---
ls.add_snippets("all", {
	-- cpp hello world
	s(":hello", {
		t({
			"#include <iostream>",
			"",
			"int main()",
			"{",
			"	std::cout << \"Hello World!\" << std::endl;",
			"	return 0;",
			"}"
		})
	}),

	s(":openlp", {
		t({
			"---[Verse:1]---",
			"---[Chorus:1]---",
			"---[Bridge:1]---",
			"---[Pre-Chorus:1]---",
			"---[Intro:1]---",
			"---[Ending:1]---",
			"---[Other:1]---",
		})
	}),
})
