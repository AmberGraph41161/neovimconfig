---| CUSTOM SETTINGS |---
require("keybinds")
require("plugins")
require("colors")
require("views")
require("luacommands")

---| PLUGIN SETTINGS/SETUP |---
require("plugins/telescope")
require("plugins/lualine")
require("plugins/colorizer")
require("plugins/nvim-tree")

---| LSP-ZERO stuff |---
require("mason").setup({
	ui =
	{
		icons =
		{
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})
require("plugins/nvim-lspconfig")
require("plugins/nvim-cmp")

---| :D |---
print("| ~^_^~ ~^_^~ | \"init.lua\" loaded. | ~^_^~ ~^_^~ |")
