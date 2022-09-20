vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'sainnhe/gruvbox-material' -- gruvbox color scheme

    -- Telescope and its deps
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- LSP and autocomplete
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'glepnir/lspsaga.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- Git stuff
    -- use 'f-person/git-blame.nvim' -- this looks fancy but provides zero useful info and on macos fogs the nvimtree / harpoon
    use 'airblade/vim-gitgutter'

    -- Vim airline for status line
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    -- Notification manager
    use 'rcarriga/nvim-notify'

    -- Harpoon for jumping between files
    use 'ThePrimeagen/harpoon'

    -- NvimTree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- for file icons
        },
    }

    -- LSP pictograms helping identify the source of autocompletion
    use 'onsails/lspkind-nvim'

    -- Trouble
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end
    }

    -- Whichkey - shows suggestions for leader key followup
    use "max397574/which-key.nvim"

    -- Auto pair keys - auto close brackets etc.
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use "lukas-reineke/lsp-format.nvim"
end)
