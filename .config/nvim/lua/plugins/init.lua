local ok, lazy = pcall(require, "lazy")
if not ok then
	return
end

lazy.setup({
	root = vim.fn.stdpath("data") .. "/lazy",
    {
		"neovim/nvim-lspconfig",
		dependencies = {
			-- LSP Stuff
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"glepnir/lspsaga.nvim",

            -- Completions
            "hrsh7th/nvim-cmp",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
        config = function ()
            -- Lsp Config
            require("plugins.configs.lsp")
            -- Completions
            require("plugins.configs.cmp")
        end
	},
	{
		"marko-cerovac/material.nvim",
		name = "material",
		lazy = false,
		priority = 1000,
		config = function ()
			require("plugins.configs.bootstrap.colorschemes")
		end
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function ()
			require("plugins.configs.bootstrap.lualine")
		end
	},
	{
		"akinsho/bufferline.nvim",
		denpendencies = {
			"kyazdani42/nvim-web-devicons"
		},
		config = function ()
			require("bufferline").setup()
		end
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function ()
			require("colorizer").setup()
		end
	},
    {
        "petertriho/nvim-scrollbar",
		config = function ()
			require("plugins.configs.nvim-scrollbar")
		end
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup()
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
		config = function ()
			require("plugins.configs.telescope")
		end
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		}
	},
    {
        "vim-scripts/c.vim",
        dependencies = {
            "ludwig/split-manpage.vim",
        }
    },
    {
        -- "fatih/vim-go",
        "crispgm/nvim-go",
    },
})
