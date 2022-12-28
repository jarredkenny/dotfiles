require("plugins")
require("opts")
require("vars")

require("catppuccin").setup()
require("auto-session").setup({})
require("nvim-tree").setup({})
require("nvim-autopairs").setup({})
require("bufferline").setup({
	options = {
		separator_style = "slant",
		always_show_bufferline = true,
		offsets = {
			{
				filetype = "NvimTree",
				text = "Files",
				text_align = "left",
				separator = true,
			},
		},
	},
})

require("telescope").setup({
	pickers = {
		find_files = {

			hidden = true,
			file_ignore_patterns = { "^.git/", "^node_modules/" },
		},
	},
})

require("lsp_signature").setup({})
require("nvim-surround").setup({})
require("nvim-tundra").setup({})
require("better_escape").setup({})

require("lualine").setup({
	options = {
		theme = "kanagawa",
		globalstatus = true,
	},
})
require("nvim-autopairs").setup({})
require("todo-comments").setup({})

require("tmux").setup({})

require("lsp")
require("vgit").setup()
require("fidget").setup({})
require("nvim_comment").setup()
require("neoscroll").setup()

require("leap").set_default_keymaps()
require("stabilize").setup()
require("trouble").setup()

require("nvim-treesitter.configs").setup({
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
})

require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = true,
})

require("lint").linters_by_ft = {
	markdown = { "vale" },
	typescript = { "eslint" },
	javascript = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function()
		vim.api.nvim_command("Neoformat")
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

require("neotest").setup({
	adapters = {
		require("neotest-jest"),
	},
})

require("alpha").setup(require("alpha.themes.startify").config)

require("keys")

require("scrollbar").setup()

vim.api.nvim_create_user_command("DiffviewToggle", function(e)
	local view = require("diffview.lib").get_current_view()

	if view then
		vim.cmd("DiffviewClose")
	else
		vim.cmd("DiffviewOpen " .. e.args)
	end
end, { nargs = "*" })
