function ColourMyPencils(color)
	color = color or "gotham"
	vim.cmd.colorscheme(color)
end

ColourMyPencils()
