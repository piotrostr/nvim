local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- pacman
  --use { "ellisonleao/gruvbox.nvim" } -- colorscheme
  use 'morhetz/gruvbox' -- colorscheme
  use 'ray-x/go.nvim'
  use 'L3MON4D3/LuaSnip' -- dep
  use 'ray-x/guihua.lua' -- dep
  use 'dinhhuy258/git.nvim' -- dep
  use 'nvim-lua/plenary.nvim' -- dep
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'onsails/lspkind-nvim' -- vscode-like pictograms

  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-nvim-lsp'

  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'

  use 'neovim/nvim-lspconfig' -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' --  LSP diagnostics, code actions, and more via Lua
  -- use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
  use 'sbdchd/neoformat'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup()
    end,
    requires = { { "nvim-tree/nvim-web-devicons" } }
  })
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })
  use 'akinsho/nvim-bufferline.lua'
  use 'aserowy/tmux.nvim'
  use 'lewis6991/gitsigns.nvim'
  use {
    "zbirenbaum/copilot-cmp",
    module = "copilot_cmp"
  }
  use 'github/copilot.vim'
  use 'puremourning/vimspector'
  use 'sebdah/vim-delve'
  use 'mfussenegger/nvim-jdtls'
end)
