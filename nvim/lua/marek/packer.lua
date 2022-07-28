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

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- Git stuff
    use 'f-person/git-blame.nvim'
    use 'airblade/vim-gitgutter'

    -- Vim airline for status line
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    -- Notification manager
    use 'rcarriga/nvim-notify'

    -- Display popup with autocompletion for typed command
    use 'folke/which-key.nvim'

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
end)
