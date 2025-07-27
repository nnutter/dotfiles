return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'shaunsingh/nord.nvim',
		config = function()
			vim.cmd('colorscheme nord')
		end
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	use 'mbbill/undotree'

	use 'tpope/vim-fugitive'
end)
