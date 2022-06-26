vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
return require('packer').startup(function()
--	use {'neoclide/coc.nvim', branch = 'release'}
  	use 'neovim/nvim-lspconfig'
	use {'ms-jpq/coq_nvim', branch = 'coq'}
	use {'ms-jpq/coq.artifacts', branch = 'artifacts'}

	use 'wbthomason/packer.nvim'
	use 'navarasu/onedark.nvim'
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
end)
