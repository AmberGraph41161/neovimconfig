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
	s(":hellocpp", {
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

	s(":hellojava", {
		t({
			"public class main",
			"{",
			"	public static void main(String[] args)",
			"	{",
			"		System.out.println(\"Hello World!\");",
			"	}",
			"}"
		})
	}),

	s(":hellosfmlcpp", {
		t({
			"#include <SFML/Graphics.hpp>",
			"",
			"int main()",
			"{",
			"	sf::RenderWindow window(sf::VideoMode(200, 200), \"SFML works!\");",
			"	sf::CircleShape shape(100.f);",
			"	shape.setFillColor(sf::Color::Green);",
			"",
			"	while (window.isOpen())",
			"	{",
			"		sf::Event event;",
			"		while (window.pollEvent(event))",
			"		{",
			"			if (event.type == sf::Event::Closed)",
			"				window.close();",
			"		}",
			"",
			"		window.clear();",
			"		window.draw(shape);",
			"		window.display();",
			"	}",
			"	",
			"	return 0;",
			"}",
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

	s(":makefile", {
		t({
			"PROJECTNAME = main",
			"OUTPUT_DIR =",
			"",
			"INCLUDE_DIRS =",
			"LIB_DIRS =",
			"",
			"LIBS = -lSDL2",
			"",
			"SRC = $(wildcard src/*.cpp) $(wildcard imgui/*.cpp)",
			"",
			"default:",
			"	clang++ $(SRC) -o $(OUTPUT_DIR)/$(PROJECTNAME) $(INCLUDE_DIRS) $(LIB_DIRS) $(LIBS)",
		})
	}),

	s(":loremipsum0", {
		t({
			"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac mi id enim tempor gravida. Fusce hendrerit, tortor vitae tristique."
		})
	}),

	s(":loremipsum1", {
		t({
			"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec est eu felis porttitor placerat non non lorem. Etiam odio lacus, mollis eget dolor in, laoreet tincidunt nibh. Vivamus blandit, nibh placerat fringilla cursus, quam libero ornare elit, non fringilla erat purus et justo. Nullam sagittis, lectus nec mattis sodales, dolor massa dignissim ipsum, faucibus luctus tellus nibh sit amet nibh. Fusce congue egestas lorem in dictum. Praesent sit amet placerat dui, ut congue libero. Sed ornare venenatis est. Nunc tempus semper nisi eu ullamcorper. Pellentesque a sodales nunc. Nulla porta, elit vitae feugiat dictum, metus nisl scelerisque purus, in rutrum felis velit a purus. Proin rutrum euismod ante, in pretium est dignissim ut. Mauris dapibus felis blandit, accumsan diam a, lobortis est. Pellentesque tristique sagittis tristique.",
			"",
			"Fusce porttitor et dolor et euismod. Nullam non est placerat, tempor elit eu, elementum lacus. In hac habitasse platea dictumst. Suspendisse et pulvinar ligula. Etiam eget placerat mauris. Donec sed felis euismod, molestie mauris et, egestas lorem. Etiam blandit elit eget ipsum rhoncus accumsan. Aliquam sit amet mollis elit. In vel dolor eu velit ornare fringilla et vitae ligula. Duis posuere sem lorem, quis placerat dolor aliquam non. In dignissim tincidunt leo, ac rutrum urna condimentum nec. Proin fringilla sollicitudin libero, quis auctor velit eleifend a.",
			"",
			"In in mauris vitae lectus dapibus efficitur. Aenean placerat nisi sed risus rhoncus efficitur. Donec sit amet nulla magna. Curabitur pulvinar elit ex, in fringilla augue ultricies eget. In posuere commodo lacinia. Etiam orci nisi, cursus a commodo in, luctus sed mi. Aliquam erat volutpat. Proin hendrerit, urna in fringilla pharetra, mi ante pharetra magna, eu tempus est tortor quis libero. Proin at pretium erat. Vestibulum lobortis, quam sagittis commodo maximus, leo diam fringilla quam, ut sollicitudin mauris augue id enim.",
			"",
			"Sed in arcu at magna efficitur faucibus. Nulla porttitor sem et neque dignissim, vitae posuere magna tincidunt. Phasellus a tristique ex, et luctus orci. Proin maximus scelerisque leo, non vulputate dolor. Vestibulum cursus nunc eu sem aliquet viverra. Donec dui massa, maximus sed mi et, fringilla aliquet ligula. Sed auctor, libero sit amet tempor luctus, turpis lacus suscipit dolor, id tempus elit enim at massa. In vitae massa vitae velit commodo hendrerit.",
			"",
			"Mauris malesuada libero non cursus sagittis. In ac lacus non arcu eleifend volutpat id eu velit. Morbi odio lectus, euismod in mattis nec, mattis eget felis. Duis tempus sit amet sapien rutrum condimentum. Nulla facilisi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sit amet tristique lectus. Nullam a urna ultrices, egestas dolor sit amet, blandit lectus. Mauris in nisl augue. Fusce ante erat, sagittis vel nulla sit amet, ullamcorper euismod risus.",
		})
	}),
})
