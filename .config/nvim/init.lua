require("plugins")
require("opts")
require("vars")

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end


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
		theme = "base16",
		globalstatus = true,
	},
})
require("nvim-autopairs").setup({})
require("todo-comments").setup({})

require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

require("tmux").setup({})
require("vgit").setup()
require("fidget").setup({})
require("nvim_comment").setup()
require("neoscroll").setup()

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


require("keys")

require("scrollbar").setup()

require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})

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
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
