---| CUSTOM SETTINGS |---
require("keybinds")
require("colors")
require("views")

---| PLUGINS |---
require("plugins")

require("plugins/telescope")
require("plugins/nvim-tree")

-- "https://github.com/hrsh7th/cmp-buffer"
--local buf = vim.api.nvim_get_current_buf()
--local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
--if byte_size < 1024 * 1024 then -- 1 Megabyte max
--	require("plugins/mason")
--	require("plugins/lsp")
--	require("plugins/nvim-cmp")
--	require("plugins/snip")
--	require("plugins/treesitter")
--	require("plugins/colorizer")
--end

require("plugins/mason")
require("plugins/lsp")
require("plugins/nvim-cmp")
require("plugins/snip")
require("plugins/treesitter")
require("plugins/colorizer")

require("plugins/lualine")

---| :D |---
print("| ~^_^~ ~^_^~ | \"init.lua\" loaded. | ~^_^~ ~^_^~ |")
