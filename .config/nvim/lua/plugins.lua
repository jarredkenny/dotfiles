local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
	use("rebelot/kanagawa.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("sam4llis/nvim-tundra")
	use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
	use("windwp/nvim-autopairs")
	use("famiu/bufdelete.nvim")
	use("max397574/better-escape.nvim")
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
	use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" })
	use("folke/tokyonight.nvim")
	use("kylechui/nvim-surround")
	use("goolord/alpha-nvim")
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-treesitter/nvim-treesitter-context")
	use("lukas-reineke/indent-blankline.nvim")
	use("rmagatti/auto-session")
	use("p00f/nvim-ts-rainbow")
	use("editorconfig/editorconfig-vim")
	use("terrortylor/nvim-comment")
	use({ "tanvirtin/vgit.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use("neovim/nvim-lspconfig")
	use("ggandor/leap.nvim")
	use("windwp/nvim-ts-autotag")
	use("ray-x/lsp_signature.nvim")
	use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
    use("folke/trouble.nvim")
	use("luukvbaal/stabilize.nvim")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("mfussenegger/nvim-lint")
	use("sbdchd/neoformat")
	use("majutsushi/tagbar")
	use("tpope/vim-fugitive")
	use("junegunn/gv.vim")
	use("RRethy/vim-illuminate")
	use("folke/todo-comments.nvim")
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
		"aserowy/tmux.nvim",
		config = function()
			require("tmux").setup({
				-- overwrite default configuration
				-- here, e.g. to enable default bindings
				copy_sync = {
					-- enables copy sync and overwrites all register actions to
					-- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
					enable = true,
				},
				navigation = {
					-- enables default keybindings (C-hjkl) for normal mode
					enable_default_keybindings = true,
				},
				resize = {
					-- enables default keybindings (A-hjkl) for normal mode
					enable_default_keybindings = true,
				},
			})
		end,
	})

	use({
		"anuvyklack/windows.nvim",
		requires = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		config = function()
			require("windows").setup()
		end,
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

    use("xiyaowong/nvim-transparent")
    use("fedepujol/move.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
