-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
--ON FIRST INSTALL PLEAE CLONE PACKER TO PACKPATH https://github.com/wbthomason/packer.nvim
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

    use({
        'yanganto/move.vim',
        branch = 'sui-move'
    })	
    
  -- Required plugins
  use 'stevearc/dressing.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'MunifTanjim/nui.nvim'
  use 'MeanderingProgrammer/render-markdown.nvim'

  -- Optional dependencies
  use 'hrsh7th/nvim-cmp'
  use 'nvim-tree/nvim-web-devicons' -- or use 'echasnovski/mini.icons'
  use 'HakonHarnes/img-clip.nvim'
  use 'zbirenbaum/copilot.lua'

  -- Avante.nvim with build process
  use {
    'yetone/avante.nvim',
    branch = 'main',
    run = 'make',
    config = function()
      require('avante_lib').load()
      require('avante').setup({provider="gemini"})
    end
  }

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
    use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
    }
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
