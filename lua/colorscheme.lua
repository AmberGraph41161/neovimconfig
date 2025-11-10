local colorschemeFilePath = "colorscheme.txt"

local file = io.open(colorschemeFilePath, "r")
if file then
	local firstLine = file:read("*line")

	if firstLine then
		vim.cmd.colorscheme(firstLine)
	end

	file:close()
else
	print("Error opening colorschemeFilePath")
end
