vim.g.mapleader = ","
vim.g.localleader = "\\"

require('plugins')
require('opts')
require('vars')
require('keys')

require('nvim-tree').setup{}

require('lualine').setup {
  options = {
    theme = 'auto'
  }
}
require('nvim-autopairs').setup{}
require('todo-comments').setup{}

require('lsp')
require('nvim_comment').setup()
require('gitsigns').setup()
require('neoscroll').setup()
require("toggleterm").setup{
    terminal_mappings = true,
}

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}

require('lint').linters_by_ft = {
  markdown = {'vale'},
  typescript = {'eslint'},
  javascript = {'eslint'},
}

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = function()
        vim.api.nvim_command('Neoformat')
    end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
