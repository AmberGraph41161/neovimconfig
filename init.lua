---| CUSTOM SETTINGS |---
require("keybinds")
require("plugins")
require("colors")
require("views")
require("luacommands")

---| PLUGIN SETTINGS/SETUP |---
-- setup must have plugins first
require("plugins/telescope")
require("plugins/lualine")

-- setup lsp plugins after
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
print("\"init.lua\" loaded. ~^_^~")
