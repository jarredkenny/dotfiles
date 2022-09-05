require("plugins")
require("opts")
require("vars")

require("auto-session").setup({})
require("nvim-tree").setup({})
require("nvim-autopairs").setup({})
require("bufferline").setup({})
require("lsp_signature").setup({})
require("nvim-surround").setup({})

require("lualine").setup({
	options = {
		theme = "tokyonight",
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
require("toggleterm").setup({
	terminal_mappings = true,
})

require("leap").set_default_keymaps()

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
