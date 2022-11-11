local cmd = vim.cmd

-- Only required if you have packer configured as `opt`
cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'

    -- Esquema de colores
    use 'rebelot/kanagawa.nvim'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Treesitter interface
    use 'nvim-treesitter/nvim-treesitter'
    use 'David-Kunz/markid'
    use 'p00f/nvim-ts-rainbow'
    use 'nvim-treesitter/playground'
    use 'windwp/nvim-autopairs'

    -- File manager
    use {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v2.x',
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'MunifTanjim/nui.nvim'
        }
    }

    -- Windows interfase
    use 'lukas-reineke/indent-blankline.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Autosave
    use 'Pocco81/auto-save.nvim'

    -- Comment
    use 'numToStr/Comment.nvim'

    -- Motion
    use {
        'phaazon/hop.nvim',
        branch = 'v2' -- optional but strongly recommended
    }

    -- Lsp resources
    use 'neovim/nvim-lspconfig'
    use 'kkharji/lspsaga.nvim'
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    -- Complete resources
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'f3fora/cmp-spell',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lua',
        },
    }
    use 'rafamadriz/friendly-snippets'
    use 'onsails/lspkind-nvim'
    use {
        'tzachar/cmp-tabnine',
        run='./install.sh'
    }

    use 'jose-elias-alvarez/null-ls.nvim'

    -- Git resources
    use 'lewis6991/gitsigns.nvim'

    -- Css
    use 'norcalli/nvim-colorizer.lua'

    --databases
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'kristijanhusak/vim-dadbod-completion'

end)
