local status, packer = pcall(require, 'packer')
if (not status) then
	print 'Packer in not install'
	return
end

packer.startup(function(use)
	-- packer
	use 'wbthomason/packer.nvim'

	-- icons
	use 'nvim-tree/nvim-web-devicons'

	-- statusline
	use {
		'nvim-lualine/lualine.nvim', event = 'BufEnter',
		config = function() require('lualine') end,
		requires = { 'nvim-web-devicons' }
	}

	-- colorscheme
	use {
		'catppuccin/nvim',
		vim.cmd 'colorscheme catppuccin-macchiato'
	}

	-- files manager
	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v2.x',
    requires = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim' },
	}

	-- terminal
	use {
		'akinsho/toggleterm.nvim',
		tag = '*',
		config = function()
			require('configs.toggleterm') end,
	}

  -- terrsitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function()
      require('configs.treesitter') end,
  }
  
  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    requires = { { "nvim-lua/plenary.nvim" } },
  }

	-- background transparent	
	use {
		'xiyaowong/nvim-transparent',
		config = function()
      require('configs.transparent') end,
	}
						
end)
