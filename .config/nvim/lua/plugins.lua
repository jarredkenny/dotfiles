local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
  use("stevearc/profile.nvim")


  -- Color Schemes
  use("rebelot/kanagawa.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("sam4llis/nvim-tundra")
  use("folke/tokyonight.nvim")
	
  -- UI & Behaviour
  use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
  use("famiu/bufdelete.nvim")
  use("windwp/nvim-autopairs")
	use("max397574/better-escape.nvim")
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
	use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" })
	use("kylechui/nvim-surround")
	use("goolord/alpha-nvim")
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-treesitter/nvim-treesitter-context")
	use("lukas-reineke/indent-blankline.nvim")
	use("rmagatti/auto-session")
	use("p00f/nvim-ts-rainbow")
	use("editorconfig/editorconfig-vim")
  use("folke/trouble.nvim")
  use("sbdchd/neoformat")
  use("majutsushi/tagbar")
  use("tpope/vim-fugitive")
  use("gbprod/yanky.nvim")
  use("xiyaowong/nvim-transparent")


  -- LSP
  use({
    'ray-x/navigator.lua',
    requires = {
        { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
        { 'neovim/nvim-lspconfig' },
    },
  })
	use("windwp/nvim-ts-autotag")
	use("ray-x/lsp_signature.nvim")

  -- Auto Completion
  use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh6th/cmp-path")
    use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("luukvbaal/stabilize.nvim")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("mfussenegger/nvim-lint")
	use("junegunn/gv.vim")
	use("RRethy/vim-illuminate")
	use("folke/todo-comments.nvim")
  use("numToStr/Comment.nvim")
	use("DanilaMihailov/beacon.nvim")
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
	use({ "akinsho/toggleterm.nvim", tag = "v2.*" })
	use("RRethy/nvim-base16")
	use("karb94/neoscroll.nvim")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use("petertriho/nvim-scrollbar")
	use("j-hui/fidget.nvim")
	use({
		"lewis6991/hover.nvim",
		config = function()
			require("hover").setup({
				init = function()
					-- Require providers
					require("hover.providers.lsp")
					-- require('hover.providers.gh')
					-- require('hover.providers.man')
					-- require('hover.providers.dictionary')
				end,
				preview_opts = {
					border = nil,
				},
				title = true,
			})

			-- Setup keymaps
			vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
			vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
		end,
	})
	use({
		"anuvyklack/windows.nvim",
		requires = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		}
	})

	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-vim-test",
			"haydenmeade/neotest-jest",
		},
	})

    use("fedepujol/move.nvim")
    use("github/copilot.vim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
