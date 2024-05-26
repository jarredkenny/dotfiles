vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.mouse = "a"
vim.opt.colorcolumn = "120"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.encoding = "utf8"
vim.opt.fileencoding = "utf8"
vim.opt.syntax = "ON"
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2
-- vim.opt.colorcolumn = "0"
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.g.t_co = 256
vim.cmd([[colorscheme base16-tomorrow-night]])
vim.cmd([[cnoreabbrev W w]])

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"nvim-lua/plenary.nvim",
	-- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" },
	"famiu/bufdelete.nvim",
	"windwp/nvim-autopairs",
	"max397574/better-escape.nvim",
	{ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" },
	{ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" },
	"kylechui/nvim-surround",
	"rmagatti/auto-session",
	"editorconfig/editorconfig-vim",
	"mfussenegger/nvim-lint",
	"folke/trouble.nvim",
	"sbdchd/neoformat",
	"luukvbaal/stabilize.nvim",
	"RRethy/vim-illuminate",
	"folke/todo-comments.nvim",
	"DanilaMihailov/beacon.nvim",
	{
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	},
	"RRethy/nvim-base16",
	"karb94/neoscroll.nvim",
	"petertriho/nvim-scrollbar",
	{ "j-hui/fidget.nvim", tag = "legacy" },
	"terrortylor/nvim-comment",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"fedepujol/move.nvim",
	"sindrets/diffview.nvim",
	"github/copilot.vim",
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
			"folke/neodev.nvim",
		},
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				vim.keymap.set(
					"n",
					"<leader>hp",
					require("gitsigns").preview_hunk,
					{ buffer = bufnr, desc = "Preview git hunk" }
				)
				-- don't override the built-in and fugitive keymaps
				local gs = package.loaded.gitsigns
				vim.keymap.set({ "n", "v" }, "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, {
					expr = true,
					buffer = bufnr,
					desc = "Jump to next hunk",
				})
				vim.keymap.set({ "n", "v" }, "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, {
					expr = true,
					buffer = bufnr,
					desc = "Jump to previous hunk",
				})
			end,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		build = ":TSUpdate",
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
})

require("auto-session").setup({})
require("nvim-tree").setup({})
require("nvim-autopairs").setup({})
require("bufferline").setup({})
require("telescope").setup({
	pickers = {
		colorscheme = { enable_preview = true },
		find_files = {
			hidden = true,
			file_ignore_patterns = { "^.git/", "^node_modules/" },
		},
	},
})
require("better_escape").setup({})
require("nvim-surround").setup({})
require("nvim_comment").setup({
	comment_empty = false,
	hook = function()
		if vim.api.nvim_buf_get_option(0, "filetype") == "vue" then
			require("ts_context_commentstring.internal").update_commentstring()
		end
	end,
})

require("nvim-treesitter.configs").setup({
	-- Add languages to be installed here that you want installed for treesitter
	ensure_installed = {
		"c",
		"cpp",
		"go",
		"lua",
		"python",
		"rust",
		"tsx",
		"javascript",
		"typescript",
		"vimdoc",
		"vim",
	},

	-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
	auto_install = false,

	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<c-space>",
			node_incremental = "<c-space>",
			scope_incremental = "<c-s>",
			node_decremental = "<M-space>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		swap = {
			enable = true,
			swap_next = { ["<leader>a"] = "@parameter.inner" },
			swap_previous = { ["<leader>A"] = "@parameter.inner" },
		},
	},
})

-- [[ Configure LSP ]]
local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

local servers = {
	clangd = {},
	gopls = {},
	pyright = {},
	rust_analyzer = {},
	tsserver = {},
	html = { filetypes = { "html", "twig", "hbs" } },

	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

require("neodev").setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({ ensure_installed = vim.tbl_keys(servers) })

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		})
	end,
})

require("lualine").setup({
	options = {
		theme = "base16",
		globalstatus = true,
		icons_enabled = false,
		component_separators = "|",
		section_separators = "",
	},
})
require("todo-comments").setup({})
require("fidget").setup({})
require("trouble").setup()

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

require("scrollbar").setup()

require("typescript-tools").setup({
	settings = {
		-- spawn additional tsserver instance to calculate diagnostics on it
		separate_diagnostic_server = true,
		-- "change"|"insert_leave" determine when the client asks the server about diagnostic
		publish_diagnostic_on = "insert_leave",
		-- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
		-- "remove_unused_imports"|"organize_imports") -- or string "all"
		-- to include all supported code actions
		-- specify commands exposed as code_actions
		expose_as_code_action = {},
		-- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
		-- not exists then standard path resolution strategy is applied
		tsserver_path = nil,
		-- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
		-- (see 💅 `styled-components` support section)
		tsserver_plugins = {},
		-- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
		-- memory limit in megabytes or "auto"(basically no limit)
		tsserver_max_memory = "auto",
		-- described below
		tsserver_format_options = {},
		tsserver_file_preferences = {},
		-- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
		complete_function_calls = false,
	},
})

local cmp = require("cmp")
local luasnip = require("luasnip")
local lsp_symbols = {
	Text = "   (Text) ",
	Method = "   (Method)",
	Function = "   (Function)",
	Constructor = "   (Constructor)",
	Field = " ﴲ  (Field)",
	Variable = "[] (Variable)",
	Class = "   (Class)",
	Interface = " ﰮ  (Interface)",
	Module = "   (Module)",
	Property = " 襁 (Property)",
	Unit = "   (Unit)",
	Value = "   (Value)",
	Enum = " 練 (Enum)",
	Keyword = "   (Keyword)",
	Snippet = "   (Snippet)",
	Color = "   (Color)",
	File = "   (File)",
	Reference = "   (Reference)",
	Folder = "   (Folder)",
	EnumMember = "   (EnumMember)",
	Constant = " ﲀ  (Constant)",
	Struct = " ﳤ  (Struct)",
	Event = "   (Event)",
	Operator = "   (Operator)",
	TypeParameter = "   (TypeParameter)",
}

local select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = {
		{ name = "buffer" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "neorg" },
	},
	mapping = {
		["<Up>"] = cmp.mapping.select_prev_item(select_opts),
		["<Down>"] = cmp.mapping.select_next_item(select_opts),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-Space>"] = cmp.mapping.complete(),
	},
	formatting = {
		format = function(entry, item)
			item.kind = lsp_symbols[item.kind]
			item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				neorg = "[Neorg]",
			})[entry.source.name]

			return item
		end,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
})

local map = vim.api.nvim_set_keymap
map("n", "<leader>G", [[:DiffviewToggle<CR>]], {})
map("n", "<leader>n", [[:NvimTreeToggle<CR>]], {})
map("n", "<leader>N", "[[:NvimTreeFocus<CR>]]", {})
map("n", "<leader>t", [[:TroubleToggle<CR>]], {})
map("n", "<leader>/", [[:CommentToggle<CR>]], {})
map("v", "<leader>/", [[:CommentToggle<CR>]], {})
map("n", "<leader>f", [[:Telescope find_files<CR>]], {})
map("n", "<leader>b", [[:Telescope buffers<CR>]], {})
map("n", "<leader>g", [[:Telescope live_grep<CR>]], {})
map("n", "<leader>cs", [[:Telescope colorscheme<CR>]], {})
map("n", "<C-S-Up>", ":MoveLine(-1)<CR>", {})
map("n", "<C-S-Down>", ":MoveLine(1)<CR>", {})
map("n", "<C-S-Left>", ":MoveHChar(-1)<CR>", {})
map("n", "<C-S-Right>", ":MoveHChar(1)<CR>", {})
map("v", "<C-S-Up>", ":MoveBlock(-1)<CR>", {})
map("v", "<C-S-Down>", ":MoveBlock(1)<CR>", {})
map("v", "<C-S-Left>", ":MoveHBlock(-1)<CR>", {})
map("v", "<C-S-Right>", ":MoveHBlock(1)<CR>", {})
map("i", "<C-S-Up>", "<Esc>:m .-2<CR>==gi", {})
map("i", "<C-S-Down>", "<Esc>:m .+1<CR>==gi", {})
map("n", "<leader>w", ":Bdelete<CR>", {})
map("n", "<leader>W", ":Bwipeout<CR>", {})
map("n", "<leader>v", ":vsplit<CR>", {})
map("n", "<leader>h", ":split<CR>", {})
map("n", "<leader><Left>", ":wincmd h<CR>", {})
map("n", "<leader><Right>", ":wincmd l<CR>", {})
map("n", "<leader><Up>", ":wincmd k<CR>", {})
map("n", "<leader><Down>", ":wincmd j<CR>", {})

-- vim:  ts=2 sts=2 sw=2 et
