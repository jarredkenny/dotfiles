local opt = vim.opt
local cmd = vim.api.nvim_command

opt.mouse = "a"
opt.colorcolumn = "120"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.signcolumn = "yes"
opt.encoding = "utf8"
opt.fileencoding = "utf8"

opt.syntax = "ON"
opt.termguicolors = true
opt.background = "dark"
vim.g.tokyonight_style = "night"
vim.g.tokyonight_cursor = "blue"
vim.g.tokyonight_enable_italic = 1
vim.g.tokyonight_transparent_background = 0
vim.g.catppuccin_flavour = "mocha"
vim.cmd([[colorscheme base16-tomorrow-night]])

vim.cmd([[cnoreabbrev W w]])

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.splitright = true
opt.splitbelow = true
