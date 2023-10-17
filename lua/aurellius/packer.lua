-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                         , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use({
		'whatyouhide/vim-gotham',
		config = function()
			vim.cmd('colorscheme gotham')
		end
	})
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() vim.cmd(':TSUpdate') 
		end
	}
    use { 
        'hrsh7th/nvim-cmp',
    }
    use { 'saadparwaiz1/cmp_luasnip' }
    use {
        'L3MON4D3/LuaSnip',
        after = 'nvim-cmp',
        config = function() require('aurellius.snippets') end,
    }
    use ('jiangmiao/auto-pairs')
	use('nvim-treesitter/playground')
	use('/theprimeagen/harpoon')
	use ('tpope/vim-fugitive')
	use ('mbbill/undotree')
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}
  end)
