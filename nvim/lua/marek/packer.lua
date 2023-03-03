vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Some colorschemes
  use "folke/tokyonight.nvim"
  use "morhetz/gruvbox"
  use "EdenEast/nightfox.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }
  use "rebelot/kanagawa.nvim"

  -- Telescope and its dependencies
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
  }

  -- LSP and autocomplete
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'onsails/lspkind-nvim'
  use "lukas-reineke/lsp-format.nvim"

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-refactor'

  -- Trouble

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }

  -- Git stuff
  use 'airblade/vim-gitgutter'
  use { 'ruifm/gitlinker.nvim', requires = 'nvim-lua/plenary.nvim' } -- get github link to given code
  use "f-person/git-blame.nvim" -- git blame inline

  -- Lualine for status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Harpoon for jumping between files
  use 'ThePrimeagen/harpoon'

  -- NvimTree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- for file icons
    },
  }

  -- Whichkey - shows suggestions for leader key followup
  use "max397574/which-key.nvim"

  -- Auto pair keys - auto close brackets etc.
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- OSCYank for cross-ssh yanking
  use "ojroques/vim-oscyank"

  -- Zen mode - might be useful
  use "folke/zen-mode.nvim"

  -- Auto highlight the word's other occurrences - commented out because of TS errors
  -- use "RRethy/vim-illuminate"

  -- Terraform support
  use 'hashivim/vim-terraform'

  -- Simple commenting
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
end)
