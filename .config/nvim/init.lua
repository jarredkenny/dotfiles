vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = false
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.hlsearch = true
vim.opt.termguicolors = true
vim.opt.cmdheight = 0
vim.opt.spelllang = "en_us"
vim.opt.spell = true

local map = vim.keymap.set

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"tpope/vim-sleuth",
	{ "shortcuts/no-neck-pain.nvim" },
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		init = function()
			require("bufferline").setup({})
		end,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
				config = {
					header = {},
					week_header = {},
					footer = {},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
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
				extensions = {},
			})
		end,
	},
	{
		"fedepujol/move.nvim",
		opts = {},
	},
	{
		"RRethy/nvim-base16",
		init = function()
			-- vim.cmd.colorscheme("base16-catppuccin")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		init = function()
			-- vim.cmd.colorscheme("kanagawa")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		init = function()
			-- vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				vim.cmd.colorscheme("vague"),
			})
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-tree").setup({
				update_focused_file = {
					enable = true,
				},
			})
		end,
	},
	{
		"famiu/bufdelete.nvim",
	},
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup({})
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		opts = {},
	},
	{
		"gbprod/cutlass.nvim",
		opts = {},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			file_types = { "markdown" },
		},
		ft = { "markdown" },
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup({})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				pickers = {
					colorscheme = {
						enable_preview = true,
					},
					find_files = {
						hidden = true,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")
			local builtin = require("telescope.builtin")
			map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			map("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			map("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			map("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			map("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			map("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			map("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files (".") for repeat' })
			map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
			-- Sumbol search
			map("n", "<leader>o", builtin.lsp_document_symbols, { desc = "[O]pen [S]ymbols" })

			map("n", "<leader>?", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			map("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			map("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						map("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
			}

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "prettier" },
				javascriptreact = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				typescriptreact = { "prettierd", "prettier" },
				markdown = { "prettierd", "prettier" },
			},
		},
	},
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				log_level = "off",
			})
		end,
	},
	{
		"OlegGulevskyy/better-ts-errors.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = {
			keymaps = {
				toggle = "<leader>dd", -- default '<leader>dd'
				go_to_definition = "<leader>dx", -- default '<leader>dx'
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				mapping = cmp.mapping.preset.insert({
					["<C-Down>"] = cmp.mapping.select_next_item(),
					["<C-Up>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete({}),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},
	{
		"azorng/goose.nvim",
		config = function()
			require("goose").setup({})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					anti_conceal = { enabled = false },
				},
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cc",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"vim",
				"vimdoc",
				"gitcommit",
			},
			auto_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- Default configuration with all available options
require("goose").setup({
	default_global_keymaps = true, -- If false, disables all default global keymaps
	keymap = {
		global = {
			toggle = "<leader>gg", -- Open goose. Close if opened
			open_input = "<leader>gi", -- Opens and focuses on input window on insert mode
			open_input_new_session = "<leader>gI", -- Opens and focuses on input window on insert mode. Creates a new session
			open_output = "<leader>go", -- Opens and focuses on output window
			toggle_focus = "<leader>gt", -- Toggle focus between goose and last window
			close = "<leader>gq", -- Close UI windows
			toggle_fullscreen = "<leader>gf", -- Toggle between normal and fullscreen mode
			select_session = "<leader>gs", -- Select and load a goose session
			goose_mode_chat = "<leader>gmc", -- Set goose mode to `chat`. (Tool calling disabled. No editor context besides selections)
			goose_mode_auto = "<leader>gma", -- Set goose mode to `auto`. (Default mode with full agent capabilities)
			configure_provider = "<leader>gp", -- Quick provider and model switch from predefined list
			diff_open = "<leader>gd", -- Opens a diff tab of a modified file since the last goose prompt
			diff_next = "<leader>g]", -- Navigate to next file diff
			diff_prev = "<leader>g[", -- Navigate to previous file diff
			diff_close = "<leader>gc", -- Close diff view tab and return to normal editing
			diff_revert_all = "<leader>gra", -- Revert all file changes since the last goose prompt
			diff_revert_this = "<leader>grt", -- Revert current file changes since the last goose prompt
		},
		window = {
			submit = "<cr>", -- Submit prompt
			close = "<esc>", -- Close UI windows
			stop = "<C-c>", -- Stop goose while it is running
			next_message = "]]", -- Navigate to next message in the conversation
			prev_message = "[[", -- Navigate to previous message in the conversation
			mention_file = "@", -- Pick a file and add to context. See File Mentions section
			toggle_pane = "<tab>", -- Toggle between input and output panes
			prev_prompt_history = "<up>", -- Navigate to previous prompt in history
			next_prompt_history = "<down>", -- Navigate to next prompt in history
		},
	},
	ui = {
		window_width = 0.35, -- Width as percentage of editor width
		input_height = 0.15, -- Input height as percentage of window height
		fullscreen = false, -- Start in fullscreen mode (default: false)
		layout = "right", -- Options: "center" or "right"
		floating_height = 0.8, -- Height as percentage of editor height for "center" layout
		display_model = true, -- Display model name on top winbar
		display_goose_mode = true, -- Display mode on top winbar: auto|chat
	},
	providers = {},
})

vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Qw wq")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev WQ wq")

map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
map("n", "<leader>t", [[:ToggleTerm<CR>]], {})
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "<leader>G", [[:DiffviewToggle<CR>]], {})
map("n", "<leader>n", [[:NvimTreeToggle<CR>]], {})
map("n", "<leader>/", [[:CommentToggle<CR>]], {})
map("v", "<leader>/", [[:CommentToggle<CR>]], {})
map("n", "<leader>f", [[:Telescope git_files<CR>]], {})
map("n", "<leader>b", [[:Telescope buffers<CR>]], {})
map("n", "<leader>g", [[:Telescope live_grep<CR>]], {})
map("n", "<leader>cs", [[:Telescope colorscheme<CR>]], {})
map("n", "<C-S-Up>", ":MoveLine(-1)<CR>", {})
map("n", "<C-S-Down>", ":MoveLine(1)<CR>", {})
map("v", "<C-S-Up>", ":MoveBlock(-1)<CR>", {})
map("v", "<C-S-Down>", ":MoveBlock(1)<CR>", {})
map("i", "<C-S-Up>", "<Esc>:m .-2<CR>==gi", {})
map("i", "<C-S-Down>", "<Esc>:m .+1<CR>==gi", {})
map("n", "<leader>w", ":Bdelete<CR>", {})
map("n", "<leader>v", ":vsplit<CR>", {})
map("n", "<leader>h", ":split<CR>", {})
map("n", "<leader><Left>", ":wincmd h<CR>", {})
map("n", "<leader><Right>", ":wincmd l<CR>", {})
map("n", "<leader><Up>", ":wincmd k<CR>", {})
map("n", "<leader><Down>", ":wincmd j<CR>", {})
map("v", "<leader>y", '"oy', {})
map("n", "<Tab>", ">>", {})
map("n", "<S-Tab>", "<<", {})
map("v", "<Tab>", ">gv", {})
map("v", "<S-Tab>", "<gv", {})
map("i", "<S-Tab>", "<C-\\><C-N><<<C-\\><C-N>^i")
map("n", "<C-Left>", ":vertical resize +5<CR>", {})
map("n", "<C-Right>", ":vertical resize -5<CR>", {})
map("n", "<C-Up>", ":resize +5<CR>", {})
map("n", "<C-Down>", ":resize -5<CR>", {})
map("n", "<C-s>", ":w<CR>", {})
map("n", "<C-w>", ":w<CR>", {})
map("t", "<Esc><Esc>", "<C-\\><C-n>", {})
map("n", "<C-d>", "<C-d>", {})

vim.cmd(":hi WinSeparator guibg=#1d1f21 guifg=#1d1f21")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

vim.opt.fillchars = { eob = " " }
--
vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "none", fg = "grey" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "grey" })
vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "none", fg = "grey" })
