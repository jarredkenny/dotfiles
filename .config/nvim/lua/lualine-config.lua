local function lsp_client()
	local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
	if #buf_clients == 0 then
		return ""
	end
	local client_names = {}
	for _, client in pairs(buf_clients) do
		table.insert(client_names, client.name)
	end
	return " " .. table.concat(client_names, ", ")
end

local function filesize()
	local size = vim.fn.getfsize(vim.fn.expand("%:p"))
	if size <= 0 then
		return ""
	end
	local suffixes = { "B", "K", "M", "G" }
	local i = 1
	while size > 1024 and i < #suffixes do
		size = size / 1024
		i = i + 1
	end
	return string.format("%.1f%s", size, suffixes[i])
end

local function encoding_conditional()
	local enc = vim.opt.fileencoding:get()
	if enc == "" then
		enc = vim.opt.encoding:get()
	end
	if enc == "utf-8" then
		return ""
	end
	return enc
end

return {
	options = {
		icons_enabled = true,
		theme = "pasteldark",
		component_separators = { left = "│", right = "│" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = { "neo-tree" },
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { { "mode", separator = { right = "◣" }, right_padding = 2 } },
		lualine_b = {
			"branch",
			{
				"diff",
				symbols = { added = " ", modified = " ", removed = " " },
			},
		},
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 1,
				symbols = {
					modified = " ●",
					readonly = " ",
					unnamed = "[No Name]",
				},
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
			{ lsp_client, icon = "" },
			{ encoding_conditional },
			{
				"filetype",
				colored = true,
				icon_only = false,
			},
		},
		lualine_y = {
			{ filesize },
			{ "progress" },
		},
		lualine_z = {
			{
				"location",
				left_padding = 2,
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = { "neo-tree", "trouble", "toggleterm" },
}
