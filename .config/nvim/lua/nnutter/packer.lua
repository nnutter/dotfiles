return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		requires = {
			'nvim-lua/plenary.nvim',
		}
	}

	use 'shaunsingh/nord.nvim'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	use 'mbbill/undotree'

	use 'tpope/vim-fugitive'

	use {
		'neovim/nvim-lspconfig',
		requires = {
			{ "ms-jpq/coq_nvim", branch = "coq" },
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
		}
	}

	use {
		'ray-x/go.nvim',
		requires = {
			'ray-x/guihua.lua', -- recommended if need floating window support
			'neovim/nvim-lspconfig',
		}
	}

	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v3.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			'MunifTanjim/nui.nvim',
		}
	}

	use 'akinsho/toggleterm.nvim'
end)
