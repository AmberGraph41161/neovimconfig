require'nvim-treesitter'.setup {
	-- Directory to install parsers and queries to
	install_dir = vim.fn.stdpath('data') .. '/site'
}

require'nvim-treesitter'.install {
	"lua",
	"c", "cpp", "cmake", "make",
	"python", "java",
	"yaml", "toml", "json",
	"bash",
}

-- https://www.reddit.com/r/neovim/comments/1kuj9xm/has_anyone_successfully_switched_to_the_new/

local enableHighlightingForFilePatterns = {
	'*.cpp',
	'*.cc',
	'*.c',
	'*.h',
	'*.hpp',
	'Makefile',
	'CMakeLists.txt',

	'*.lua',

	'*.py',

	'*.java',
}

--vim.api.nvim_create_autocmd({ 'FileType', 'BufEnter', 'BufWinEnter' }, {
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
	pattern = enableHighlightingForFilePatterns,
	callback = function() vim.treesitter.start() end
})

function nvimTreeSitterHighlightStart()
	vim.treesitter.start()
end

function nvimTreeSitterHighlightStop()
	vim.treesitter.stop()
end
