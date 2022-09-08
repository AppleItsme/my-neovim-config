vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use "bryant-the-coder/astron.nvim"
	use {
	  'saadparwaiz1/cmp_luasnip',
	  requires = {
		-- LSP Support
		{'neovim/nvim-lspconfig'},
		{'williamboman/nvim-lsp-installer'},

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},
		{'hrsh7th/cmp-buffer'},
		{'hrsh7th/cmp-path'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/cmp-nvim-lua'},

		-- Snippets
		{'L3MON4D3/LuaSnip'},
	  }
	}	
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim'
	use {
		's1n7ax/nvim-window-picker',
		tag = 'v1.*',
		config = function()
			require'window-picker'.setup()
		end,
	}
	use {
	  	"nvim-neo-tree/neo-tree.nvim",
	    	branch = "v2.x",
	    	requires = { 
	      		"nvim-lua/plenary.nvim",
	      		"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
	      		"MunifTanjim/nui.nvim",
	    	}
	}
end)

