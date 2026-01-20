vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
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
vim.opt.fillchars = { eob = " " }

-- Enable spell check only for specific file types
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.spell = true
	end,
})

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 2,
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

local map = vim.keymap.set

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"tpope/vim-sleuth",
	{ "shortcuts/no-neck-pain.nvim", cmd = "NoNeckPain" },
	{
		"webhooked/kanso.nvim",
		lazy = true,
	},
	{
		"pauchiner/pastelnight.nvim",
		lazy = true,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
	},
	{
		"nordtheme/vim",
		name = "nord",
		lazy = true,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
	},
	{
		"sainnhe/everforest",
		lazy = true,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
	},
	{
		"Shatur/neovim-ayu",
		lazy = true,
	},
	{
		"vague-theme/vague.nvim",
		lazy = true,
	},
	{
		"RRethy/base16-nvim",
		lazy = true,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		init = function()
			require("bufferline").setup({
				options = {
					offsets = {
						{
							filetype = "neo-tree",
							text = "File Explorer",
							text_align = "center",
							separator = false,
						},
					},
					separator_style = "slant",
				},
			})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				popup_border_style = "rounded",
				enable_git_status = true,
				enable_diagnostics = true,
				default_component_configs = {
					indent = {
						indent_size = 2,
						padding = 1,
						with_markers = true,
						indent_marker = "│",
						last_indent_marker = "└",
						highlight = "NeoTreeIndentMarker",
					},
					icon = {
						folder_closed = "",
						folder_open = "",
						folder_empty = "",
						default = "",
					},
					git_status = {
						symbols = {
							added = "",
							modified = "",
							deleted = "",
							renamed = "",
							untracked = "",
							ignored = "",
							unstaged = "",
							staged = "",
							conflict = "",
						},
					},
				},
				window = {
					position = "left",
					width = 30,
					mapping_options = {
						noremap = true,
						nowait = true,
					},
					mappings = {
						["<space>"] = {
							"toggle_node",
							nowait = false,
						},
						["<2-LeftMouse>"] = "open",
						["<cr>"] = "open",
						["<esc>"] = "cancel",
						["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
						["l"] = "focus_preview",
						["S"] = "open_split",
						["s"] = "open_vsplit",
						["t"] = "open_tabnew",
						["w"] = "open_with_window_picker",
						["C"] = "close_node",
						["z"] = "close_all_nodes",
						["a"] = {
							"add",
							config = {
								show_path = "none",
							},
						},
						["A"] = "add_directory",
						["d"] = "delete",
						["r"] = "rename",
						["y"] = "copy_to_clipboard",
						["x"] = "cut_to_clipboard",
						["p"] = "paste_from_clipboard",
						["c"] = "copy",
						["m"] = "move",
						["q"] = "close_window",
						["R"] = "refresh",
						["?"] = "show_help",
						["<"] = "prev_source",
						[">"] = "next_source",
						["i"] = "show_file_details",
					},
				},
				filesystem = {
					filtered_items = {
						visible = false,
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_hidden = true,
					},
					follow_current_file = {
						enabled = true,
					},
					use_libuv_file_watcher = true,
				},
			})
		end,
	},
	-- Dashboard disabled in favor of telescope file_browser on startup
	-- {
	-- 	"nvimdev/dashboard-nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("dashboard").setup({
	-- 			config = {
	-- 				header = {},
	-- 				week_header = {},
	-- 				footer = {},
	-- 			},
	-- 		})
	-- 	end,
	-- 	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	-- },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup(require("lualine-config"))
		end,
	},
	{
		"fedepujol/move.nvim",
		opts = {},
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
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 500,
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
		"esmuellert/codediff.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		cmd = "CodeDiff",
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
			pcall(require("telescope").load_extension, "file_browser")
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
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
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
					local lsp_map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					lsp_map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					lsp_map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					lsp_map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					lsp_map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					lsp_map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					lsp_map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					lsp_map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					lsp_map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					lsp_map("K", vim.lsp.buf.hover, "Hover Documentation")
					lsp_map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

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
						lsp_map("<leader>th", function()
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
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 2000,
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
				keymaps = {
					accept_suggestion = "<C-y>",
					clear_suggestion = "<C-]>",
					accept_word = "<C-j>",
				},
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
				dependencies = { "rafamadriz/friendly-snippets" },
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			-- Load friendly-snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
						show_labelDetails = true,
						before = function(entry, vim_item)
							-- Show source
							vim_item.menu = ({
								nvim_lsp = "[LSP]",
								luasnip = "[Snippet]",
								buffer = "[Buffer]",
								path = "[Path]",
								supermaven = "[AI]",
							})[entry.source.name]
							return vim_item
						end,
					}),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Down>"] = cmp.mapping.select_next_item(),
					["<C-Up>"] = cmp.mapping.select_prev_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "supermaven" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer", keyword_length = 3 },
					{ name = "path" },
				},
			})

			-- Command-line completion for /
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Command-line completion for :
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{ "akinsho/toggleterm.nvim", version = "*", cmd = "ToggleTerm", config = true },
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
				"typescript",
				"tsx",
				"javascript",
				"json",
				"css",
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
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			enable = true,
			max_lines = 3,
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true,
			})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"mrjones2014/smart-splits.nvim",
		lazy = false,
		config = function()
			require("smart-splits").setup({
				ignored_filetypes = { "nofile", "quickfix", "prompt" },
				ignored_buftypes = { "NeoTree" },
				at_edge = "stop",
				multiplexer_integration = "tmux",
			})
		end,
	},
	{
		"hedyhli/outline.nvim",
		cmd = { "Outline", "OutlineOpen" },
		keys = {
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle symbols [O]utline" },
		},
		opts = {
			outline_window = {
				position = "right",
				width = 25,
				relative_width = true,
			},
			outline_items = {
				show_symbol_details = true,
			},
			symbols = {
				icons = {
					File = { icon = "", hl = "@text.uri" },
					Module = { icon = "", hl = "@namespace" },
					Namespace = { icon = "", hl = "@namespace" },
					Package = { icon = "", hl = "@namespace" },
					Class = { icon = "𝓒", hl = "@type" },
					Method = { icon = "ƒ", hl = "@method" },
					Property = { icon = "", hl = "@method" },
					Field = { icon = "", hl = "@field" },
					Constructor = { icon = "", hl = "@constructor" },
					Enum = { icon = "", hl = "@type" },
					Interface = { icon = "", hl = "@type" },
					Function = { icon = "", hl = "@function" },
					Variable = { icon = "", hl = "@constant" },
					Constant = { icon = "", hl = "@constant" },
					String = { icon = "𝓐", hl = "@string" },
					Number = { icon = "#", hl = "@number" },
					Boolean = { icon = "⊨", hl = "@boolean" },
					Array = { icon = "", hl = "@constant" },
					Object = { icon = "⦿", hl = "@type" },
					Key = { icon = "🔐", hl = "@type" },
					Null = { icon = "NULL", hl = "@type" },
					EnumMember = { icon = "", hl = "@field" },
					Struct = { icon = "𝓢", hl = "@type" },
					Event = { icon = "🗲", hl = "@type" },
					Operator = { icon = "+", hl = "@operator" },
					TypeParameter = { icon = "𝙏", hl = "@parameter" },
					Component = { icon = "", hl = "@function" },
					Fragment = { icon = "", hl = "@constant" },
				},
			},
		},
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
map("n", "<leader>n", [[:Neotree toggle<CR>]], { desc = "Toggle file tree" })
map("n", "<leader>/", [[:CommentToggle<CR>]], {})
map("v", "<leader>/", [[:CommentToggle<CR>]], {})
-- Project files with fallback for non-git repos
local function project_files()
	local ok = pcall(require("telescope.builtin").git_files, {})
	if not ok then
		require("telescope.builtin").find_files({})
	end
end
map("n", "<leader>f", project_files, {})
map("n", "<leader>fb", [[:Telescope file_browser<CR>]], {})
map("n", "<leader>b", [[:Telescope buffers<CR>]], {})
map("n", "<leader>g", [[:Telescope live_grep<CR>]], {})
map("n", "<leader>cs", [[:Telescope colorscheme<CR>]], {})
map("n", "<leader>gd", [[:CodeDiff<CR>]], {})
map("n", "<C-S-Up>", ":MoveLine(-1)<CR>", {})
map("n", "<C-S-Down>", ":MoveLine(1)<CR>", {})
map("v", "<C-S-Up>", ":MoveBlock(-1)<CR>", {})
map("v", "<C-S-Down>", ":MoveBlock(1)<CR>", {})
map("i", "<C-S-Up>", "<Esc>:m .-2<CR>==gi", {})
map("i", "<C-S-Down>", "<Esc>:m .+1<CR>==gi", {})
map("n", "<leader>w", ":Bdelete<CR>", {})
map("n", "<leader>v", ":vsplit<CR>", {})
map("n", "<leader>h", ":split<CR>", {})

-- Smart-splits navigation (matches tmux Shift+Arrow)
map("n", "<S-Left>", function() require("smart-splits").move_cursor_left() end, { desc = "Move to left split" })
map("n", "<S-Right>", function() require("smart-splits").move_cursor_right() end, { desc = "Move to right split" })
map("n", "<S-Up>", function() require("smart-splits").move_cursor_up() end, { desc = "Move to upper split" })
map("n", "<S-Down>", function() require("smart-splits").move_cursor_down() end, { desc = "Move to lower split" })
map("v", "<leader>y", '"+y', {})
map("n", "<Tab>", ">>", {})
map("n", "<S-Tab>", "<<", {})
map("v", "<Tab>", ">gv", {})
map("v", "<S-Tab>", "<gv", {})
map("i", "<S-Tab>", "<C-\\><C-N><<<C-\\><C-N>^i")
map("n", "<C-Left>", ":vertical resize +5<CR>", {})
map("n", "<C-Right>", ":vertical resize -5<CR>", {})
map("n", "<C-s>", ":w<CR>", {})
map("n", "<C-w>", ":w<CR>", {})
map("t", "<Esc><Esc>", "<C-\\><C-n>", {})
map("n", "<C-d>", "<C-d>", {})

vim.cmd.colorscheme('pasteldark')

-- Make window separators invisible
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#131a21", bg = "#131a21" })
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#131a21", bg = "#131a21" })

-- Make neo-tree background darker for depth effect
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#10171e" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#10171e" })
vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "#10171e" })
