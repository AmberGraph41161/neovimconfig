-- as of Thursday, March 06, 2025, 16:17:36
-- telescope live grep requires ripgrep

-- different togglable setup settings
local function defaultSetup()
	require("telescope").setup {
		defaults = {
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
local disrespectGitignore = false;
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
