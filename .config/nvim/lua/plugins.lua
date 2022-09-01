local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim'  }
  use { 'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use 'nvim-treesitter/nvim-treesitter'
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'editorconfig/editorconfig-vim'
  use 'lewis6991/gitsigns.nvim'
  use 'terrortylor/nvim-comment'
  use 'neovim/nvim-lspconfig' 
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip' 
  use 'L3MON4D3/LuaSnip' 
  use 'mfussenegger/nvim-lint'
  use 'sbdchd/neoformat' 
  use 'majutsushi/tagbar'                     
  use 'Yggdroot/indentLine'                
  use 'tpope/vim-fugitive'              
  use 'junegunn/gv.vim'               
  use 'windwp/nvim-autopairs'        
  use 'RRethy/vim-illuminate'
  use 'folke/todo-comments.nvim'
  use 'mhinz/vim-startify' 
  use 'DanilaMihailov/beacon.nvim' 
  use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
  use { "akinsho/toggleterm.nvim", tag = 'v2.*' }
  use 'RRethy/nvim-base16'
  use 'karb94/neoscroll.nvim'

  if packer_bootstrap then
   require('packer').sync()
  end
end)
