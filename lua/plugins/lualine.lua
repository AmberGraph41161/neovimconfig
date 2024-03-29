require("lualine").setup {
	options = {
		icons_enabled = true,
		theme = "auto", -- same thing as a color scheme
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}

--[[
+-------------------------------------------------+
| A | B | C                             X | Y | Z |
+-------------------------------------------------+
]]


--[[
	Available components

	- `branch` (git branch)
	- `buffers` (shows currently available buffers)
	- `diagnostics` (diagnostics count from your preferred source)
	- `diff` (git diff status)
	- `encoding` (file encoding)
	- `fileformat` (file format)
	- `filename`
	- `filesize`
	- `filetype`
	- `hostname`
	- `location` (location in file in line:column format)
	- `mode` (vim mode)
	- `progress` (%progress in file)
	- `searchcount` (number of search matches when hlsearch is active)
	- `tabs` (shows currently available tabs)
	- `windows` (shows currently available windows)
]]




--[[
# Available themes

### auto

auto is a special theme. It will automatically load theme for your colorscheme.
If there's no theme available for your colorscheme then
it'll try it's best to generate one.

### 16color
### ayu_dark
### ayu_light
### ayu_mirage
### base16
### codedark
### dracula
### everforest
### gruvbox_dark
### gruvbox_light
### gruvbox
### gruvbox-material
### horizon
### iceberg_dark
### iceberg_light
### iceberg
### jellybeans
### material
### modus-vivendi
### molokai
### moonfly
## nightfly
### nord
### OceanicNext
### onedark
### onelight
### palenight
### papercolor_dark
### papercolor_light
### PaperColor
### powerline
### powerline_dark
### pywal
#### `wal --theme ashes`
#### `wal --theme -l github`
#### `wal --theme vscode`
#### `wal --theme zenburn`
### seoul256
### solarized_dark
### solarized_light
### Tomorrow
### wombat
]]
