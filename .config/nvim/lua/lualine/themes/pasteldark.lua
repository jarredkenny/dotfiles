-- PastelDark theme for lualine
local colors = {
	bg = "#131a21",
	fg = "#b5bcc9",
	statusline_bg = "#181f26",
	orange = "#EDA685",
	blue = "#99aee5",
	green = "#9fe8c3",
	red = "#ef8891",
	yellow = "#fbdf90",
	purple = "#c2a2e3",
	grey = "#4e555c",
	one_bg = "#1e252c",
	one_bg2 = "#2a3138",
}

local pasteldark = {
	normal = {
		a = { bg = colors.orange, fg = colors.bg, gui = "bold" },
		b = { bg = colors.one_bg2, fg = colors.fg },
		c = { bg = colors.statusline_bg, fg = colors.fg },
		x = { bg = colors.statusline_bg, fg = colors.fg },
		y = { bg = colors.one_bg2, fg = colors.fg },
		z = { bg = colors.orange, fg = colors.bg, gui = "bold" },
	},
	insert = {
		a = { bg = colors.green, fg = colors.bg, gui = "bold" },
		b = { bg = colors.one_bg2, fg = colors.fg },
		c = { bg = colors.statusline_bg, fg = colors.fg },
		x = { bg = colors.statusline_bg, fg = colors.fg },
		y = { bg = colors.one_bg2, fg = colors.fg },
		z = { bg = colors.green, fg = colors.bg, gui = "bold" },
	},
	visual = {
		a = { bg = colors.purple, fg = colors.bg, gui = "bold" },
		b = { bg = colors.one_bg2, fg = colors.fg },
		c = { bg = colors.statusline_bg, fg = colors.fg },
		x = { bg = colors.statusline_bg, fg = colors.fg },
		y = { bg = colors.one_bg2, fg = colors.fg },
		z = { bg = colors.purple, fg = colors.bg, gui = "bold" },
	},
	replace = {
		a = { bg = colors.red, fg = colors.bg, gui = "bold" },
		b = { bg = colors.one_bg2, fg = colors.fg },
		c = { bg = colors.statusline_bg, fg = colors.fg },
		x = { bg = colors.statusline_bg, fg = colors.fg },
		y = { bg = colors.one_bg2, fg = colors.fg },
		z = { bg = colors.red, fg = colors.bg, gui = "bold" },
	},
	command = {
		a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
		b = { bg = colors.one_bg2, fg = colors.fg },
		c = { bg = colors.statusline_bg, fg = colors.fg },
		x = { bg = colors.statusline_bg, fg = colors.fg },
		y = { bg = colors.one_bg2, fg = colors.fg },
		z = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
	},
	inactive = {
		a = { bg = colors.statusline_bg, fg = colors.grey },
		b = { bg = colors.statusline_bg, fg = colors.grey },
		c = { bg = colors.statusline_bg, fg = colors.grey },
	},
}

return pasteldark
