return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- color schemes
    use "EdenEast/nightfox.nvim"
    use { "ellisonleao/gruvbox.nvim" }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-abolish'

    use 'vim-test/vim-test'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/playground'

    use {
      "windwp/nvim-autopairs",
    }

    use {
        "danymat/neogen",
        config = function()
            require('neogen').setup {}
        end,
        requires = "nvim-treesitter/nvim-treesitter",
        -- Uncomment next line if you want to follow only stable versions
        -- tag = "*"
    }

    use {
        'kkoomen/vim-doge',
        run = ':call doge#install()'
    }

    use 'mhinz/vim-startify'

    -- LSP
    use 'neovim/nvim-lspconfig' -- enable LSP
    use 'williamboman/nvim-lsp-installer'
    use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
    -- use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
    use 'phpactor/phpactor'

    -- CMP Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- Spippets
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use "rafamadriz/friendly-snippets"

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use 'onsails/lspkind.nvim'

    use {
        "ThePrimeagen/harpoon",
        requires = {
            "nvim-lua/plenary.nvim"
        }
    }

    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "olimorris/neotest-phpunit",
        },
        config = function()
            require('neotest').setup({
                adapters = {
                    require('neotest-phpunit')({
                        phpunit_cmd = function()
                            return "run test"
                        end
                    }),
                }
            })
        end
    }

    use 'lambdalisue/suda.vim'

    use({
        'Wansmer/treesj',
        requires = { 'nvim-treesitter'}
    })
end)
