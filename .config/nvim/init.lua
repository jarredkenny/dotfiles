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
    colorscheme = {
      enable_preview = true
    },
		find_files = {
			hidden = true,
			file_ignore_patterns = { "^.git/", "^node_modules/" },
		},
	},
})

require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true},
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = false,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = false,       -- adjust window separators highlight for laststatus=3
    terminalColors = true,      -- define vim.g.terminal_color_{0,17}
    colors = {},
    overrides = {},
    theme = "default"           -- Load "default" theme or the experimental "light" theme
})

require("lsp_signature").setup({})
require("nvim-surround").setup({})
require("nvim-tundra").setup({})
require("better_escape").setup({})
require("yanky").setup({})

require("lualine").setup({
	options = {
		theme = "kanagawa",
		globalstatus = true,
	},
})
require("nvim-autopairs").setup({})
require("todo-comments").setup({})

-- require('lspconfig')['tsserver'].setup({})
require('navigator').setup({
  lsp = {
    disable_lsp = { "denols"}
  }
})

require("tmux").setup({})
require("vgit").setup()
require("fidget").setup({})
require("nvim_comment").setup()
require("neoscroll").setup()
require("trouble").setup()
require("stabilize").setup()

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

local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    })
  })
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, 
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- require('lspconfig')['tsserver'].setup {
  --   capabilities = capabilities
  -- }

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
