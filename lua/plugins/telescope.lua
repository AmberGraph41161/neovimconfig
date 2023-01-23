local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", builtin.find_files, {}) -- find files
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- live grep
vim.keymap.set("n", "<leader>fb", builtin.buffers, {}) -- builtin buffers
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {}) -- builtin help tags
