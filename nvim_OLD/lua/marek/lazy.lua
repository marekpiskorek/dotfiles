-- Initialize Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
	},

	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	},

	-- colorschemes
	"rebelot/kanagawa.nvim",
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "dasupradyumna/midnight.nvim", lazy = false, priority = 1000 },
	{ "maxmx03/solarized.nvim", lazy = false, priority = 1000 },
	{ "phha/zenburn.nvim", lazy = false, priority = 1000 },
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
	{ "AlexvZyl/nordic.nvim", priority = 1000 },
	{ "theamallalgi/zitchdog", priority = 1000 },
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				-- Your config here
			})
		end,
	},

	-- Telescope and its dependencies
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" },
		config = function()
			require("telescope").load_extension("live_grep_args")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},

	-- Treesitter
	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},
	-- add context info for super long functions / classes / whatever.
	"nvim-treesitter/nvim-treesitter-context",

	-- Git stuff
	"airblade/vim-gitgutter",
	{ "ruifm/gitlinker.nvim", dependencies = { "nvim-lua/plenary.nvim" } }, -- get github link to given code
	"f-person/git-blame.nvim", -- git blame inline

	-- Lualine for status line
	{ "nvim-lualine/lualine.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },

	-- Harpoon for jumping between files
	"ThePrimeagen/harpoon",

	-- NvimTree
	{ "kyazdani42/nvim-tree.lua", dependencies = { "kyazdani42/nvim-web-devicons" } },

	-- Whichkey - shows suggestions for leader key followup
	"max397574/which-key.nvim",

	-- Auto pair keys - auto close brackets etc.
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- Auto highlight the word's other occurrences - commented out because of TS errors
	"RRethy/vim-illuminate",

	-- Terraform support
	"hashivim/vim-terraform",

	-- Simple commenting
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- FZF - sometimes telescope is just too slow.
	"junegunn/fzf",
	"junegunn/fzf.vim",

	-- Vim Fugitive, for integration with FZF
	"tpope/vim-fugitive",

	-- Move smoothly between Nvim and Tmux panes
	"christoomey/vim-tmux-navigator",

	-- Copilot
	"github/copilot.vim",
	-- Black formatter for Python code
	"averms/black-nvim",

	{ -- aerial - code outline window for skimming and quick navigation
		"stevearc/aerial.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	},
	-- For preparing and managing pickers for Telescope
	{ "axkirillov/easypick.nvim", dependencies = "nvim-telescope/telescope.nvim" },
})
