-- different togglable setup settings
local function defaultSetup()
	require("telescope").setup {
		defaults = {
			-- "https://github.com/nvim-telescope/telescope.nvim"
		},
		pickers = {
			find_files = {
				--theme = "dropdown", -- "dropdown", "cursor", "ivy"
				winblend = 0
			}
		},
		extensions = {
		}
	}
end

local function dotfileSetup()
	require("telescope").setup {
		defaults = {
			-- "https://github.com/nvim-telescope/telescope.nvim"
		},
		pickers = {
			find_files = {
				--theme = "dropdown", -- "dropdown", "cursor", "ivy"
				find_command = { "rg", "--files", "--hidden" },
				winblend = 0
			}
		},
		extensions = {
		}
	}
end
defaultSetup() -- call default setup setting so we can actually do stuff

local builtin = require("telescope.builtin")
local disrespectGitignore = true;
vim.keymap.set("n", "<leader>fi", function() disrespectGitignore = true; print("disrepectgitignore = true"); end, {})
vim.keymap.set("n", "<leader>fI", function() disrespectGitignore = false; print("disrepectgitignore = false"); end, {})

vim.keymap.set("n", "<leader>fd", function() defaultSetup(); print("telescope no dotfiles"); end, {})
vim.keymap.set("n", "<leader>fD", function() dotfileSetup(); print("telescope dotfiles"); end, {})

vim.keymap.set("n", "<leader>ff", function() builtin.find_files({ no_ignore = disrespectGitignore }); end, {}) -- find files
vim.keymap.set("n", "<leader>fF", function() builtin.find_files({ no_ignore = disrespectGitignore }); end, {}) -- find files
vim.keymap.set("n", "<leader>fg", function() builtin.live_grep({ no_ignore = disrespectGitignore }); end, {}) -- live grep
vim.keymap.set("n", "<leader>fb", function() builtin.buffers({ no_ignore = disrespectGitignore }); end, {}) -- builtin buffers
vim.keymap.set("n", "<leader>fh", function() builtin.help_tags({ no_ignore = disrespectGitignore }); end, {}) -- builtin help tags
vim.keymap.set("n", "<leader>fc", function() builtin.colorscheme({ no_ignore = disrespectGitignore }); end, {}) -- colorschemes







---| custom picker stuff idk |---
-- "https://github.com/nvim-telescope/telescope.nvim/blob/master/developers.md"
--[[
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

local themes = function(opts) -- opts can take in stuff like "require("telescope.themes").get_dropdown{})"
	opts = opts or {}
	pickers.new(opts, {
		prompt_title = "pick theme lol idk title goes here",
		finder = finders.new_table {
			results = { "test", "test1 idk", "elflord" }
		},
		sorter = conf.generic_sorter(opts),
	}):find()
end

-- themes()
]]






--[[ some random documentation ripped from their README.md page

### File Pickers

| Functions             | Description                                                                                                                                                              |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `builtin.find_files`  | Lists files in your current working directory, respects .gitignore                                                                                                       |
| `builtin.git_files`   | Fuzzy search through the output of `git ls-files` command, respects .gitignore                                                                                           |
| `builtin.grep_string` | Searches for the string under your cursor or selection in your current working directory                                                                                 |
| `builtin.live_grep`   | Search for a string in your current working directory and get results live as you type, respects .gitignore. (Requires [ripgrep](https://github.com/BurntSushi/ripgrep)) |

### Vim Pickers

| Functions                           | Description                                                                                                                                                 |
| ----------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `builtin.buffers`                   | Lists open buffers in current neovim instance                                                                                                               |
| `builtin.oldfiles`                  | Lists previously open files                                                                                                                                 |
| `builtin.commands`                  | Lists available plugin/user commands and runs them on `<cr>`                                                                                                |
| `builtin.tags`                      | Lists tags in current directory with tag location file preview (users are required to run ctags -R to generate tags or update when introducing new changes) |
| `builtin.command_history`           | Lists commands that were executed recently, and reruns them on `<cr>`                                                                                       |
| `builtin.search_history`            | Lists searches that were executed recently, and reruns them on `<cr>`                                                                                       |
| `builtin.help_tags`                 | Lists available help tags and opens a new window with the relevant help info on `<cr>`                                                                      |
| `builtin.man_pages`                 | Lists manpage entries, opens them in a help window on `<cr>`                                                                                                |
| `builtin.marks`                     | Lists vim marks and their value                                                                                                                             |
| `builtin.colorscheme`               | Lists available colorschemes and applies them on `<cr>`                                                                                                     |
| `builtin.quickfix`                  | Lists items in the quickfix list                                                                                                                            |
| `builtin.quickfixhistory`           | Lists all quickfix lists in your history and open them with `builtin.quickfix` or quickfix window                                                           |
| `builtin.loclist`                   | Lists items from the current window's location list                                                                                                         |
| `builtin.jumplist`                  | Lists Jump List entries                                                                                                                                     |
| `builtin.vim_options`               | Lists vim options, allows you to edit the current value on `<cr>`                                                                                           |
| `builtin.registers`                 | Lists vim registers, pastes the contents of the register on `<cr>`                                                                                          |
| `builtin.autocommands`              | Lists vim autocommands and goes to their declaration on `<cr>`                                                                                              |
| `builtin.spell_suggest`             | Lists spelling suggestions for the current word under the cursor, replaces word with selected suggestion on `<cr>`                                          |
| `builtin.keymaps`                   | Lists normal mode keymappings                                                                                                                               |
| `builtin.filetypes`                 | Lists all available filetypes                                                                                                                               |
| `builtin.highlights`                | Lists all available highlights                                                                                                                              |
| `builtin.current_buffer_fuzzy_find` | Live fuzzy search inside of the currently open buffer                                                                                                       |
| `builtin.current_buffer_tags`       | Lists all of the tags for the currently open buffer, with a preview                                                                                         |
| `builtin.resume`                    | Lists the results incl. multi-selections of the previous picker                                                                                             |
| `builtin.pickers`                   | Lists the previous pickers incl. multi-selections (see `:h telescope.defaults.cache_picker`)                                                                |

### Neovim LSP Pickers

| Functions                               | Description                                                                                                                |
| --------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `builtin.lsp_references`                | Lists LSP references for word under the cursor                                                                             |
| `builtin.lsp_incoming_calls`            | Lists LSP incoming calls for word under the cursor                                                                         |
| `builtin.lsp_outgoing_calls`            | Lists LSP outgoing calls for word under the cursor                                                                         |
| `builtin.lsp_document_symbols`          | Lists LSP document symbols in the current buffer                                                                           |
| `builtin.lsp_workspace_symbols`         | Lists LSP document symbols in the current workspace                                                                        |
| `builtin.lsp_dynamic_workspace_symbols` | Dynamically Lists LSP for all workspace symbols                                                                            |
| `builtin.diagnostics`                   | Lists Diagnostics for all open buffers or a specific buffer. Use option `bufnr=0` for current buffer.                      |
| `builtin.lsp_implementations`           | Goto the implementation of the word under the cursor if there's only one, otherwise show all options in Telescope          |
| `builtin.lsp_definitions`               | Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope             |
| `builtin.lsp_type_definitions`          | Goto the definition of the type of the word under the cursor, if there's only one, otherwise show all options in Telescope |

### Git Pickers

| Functions                    | Description                                                                                                                                                                                           |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `builtin.git_commits`        | Lists git commits with diff preview, checkout action `<cr>`, reset mixed `<C-r>m`, reset soft `<C-r>s` and reset hard `<C-r>h`                                                                        |
| `builtin.git_bcommits`       | Lists buffer's git commits with diff preview and checks them out on `<cr>`                                                                                                                            |
| `builtin.git_bcommits_range` | Lists buffer's git commits in a range of lines. Use options `from` and `to` to specify the range. In visual mode, lists commits for the selected lines                                                |
| `builtin.git_branches`       | Lists all branches with log preview, checkout action `<cr>`, track action `<C-t>`, rebase action`<C-r>`, create action `<C-a>`, switch action `<C-s>`, delete action `<C-d>` and merge action `<C-y>` |
| `builtin.git_status`         | Lists current changes per file with diff preview and add action. (Multi-selection still WIP)                                                                                                          |
| `builtin.git_stash`          | Lists stash items in current repository with ability to apply them on `<cr>`                                                                                                                          |

### Treesitter Picker

| Functions            | Description                                       |
| -------------------- | ------------------------------------------------- |
| `builtin.treesitter` | Lists Function names, variables, from Treesitter! |

### Lists Picker

| Functions          | Description                                                                                                                                                                               |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `builtin.planets`  | Use the telescope...                                                                                                                                                                      |
| `builtin.builtin`  | Lists Built-in pickers and run them on `<cr>`.                                                                                                                                            |
| `builtin.reloader` | Lists Lua modules and reload them on `<cr>`.                                                                                                                                              |
| `builtin.symbols`  | Lists symbols inside a file `data/telescope-sources/*.json` found in your rtp. More info and symbol sources can be found [here](https://github.com/nvim-telescope/telescope-symbols.nvim) |

## Previewers

| Previewers                          | Description                                               |
| ----------------------------------- | --------------------------------------------------------- |
| `previewers.vim_buffer_cat.new`     | Default previewer for files. Uses vim buffers             |
| `previewers.vim_buffer_vimgrep.new` | Default previewer for grep and similar. Uses vim buffers  |
| `previewers.vim_buffer_qflist.new`  | Default previewer for qflist. Uses vim buffers            |
| `previewers.cat.new`                | Terminal previewer for files. Uses `cat`/`bat`            |
| `previewers.vimgrep.new`            | Terminal previewer for grep and similar. Uses `cat`/`bat` |
| `previewers.qflist.new`             | Terminal previewer for qflist. Uses `cat`/`bat`           |

]]
