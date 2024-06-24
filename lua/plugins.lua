-- Configuration table for lazy.nvim
require("lazy").setup({
  -- 'ellisonleao/gruvbox.nvim', -- colorscheme
  -- 'morhetz/gruvbox', -- colorscheme
  'ellisonleao/gruvbox.nvim',
  'ray-x/go.nvim',
  'L3MON4D3/LuaSnip', -- dep
  'ray-x/guihua.lua', -- dep
  'dinhhuy258/git.nvim', -- dep
  'nvim-lua/plenary.nvim', -- dep
  'nvim-lualine/lualine.nvim', -- Statusline
  'onsails/lspkind-nvim', -- vscode-like pictograms

  'hrsh7th/nvim-cmp',

  'hrsh7th/cmp-nvim-lsp',

  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-buffer',
  'hrsh7th/vim-vsnip',

  'neovim/nvim-lspconfig', -- LSP
  'jose-elias-alvarez/null-ls.nvim', -- LSP diagnostics, code actions, and more via Lua
  -- 'MunifTanjim/prettier.nvim', -- Prettier plugin for Neovim's built-in LSP client
  'sbdchd/neoformat',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup()
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-context',
  'kyazdani42/nvim-web-devicons', -- File icons
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  'akinsho/nvim-bufferline.lua',
  'aserowy/tmux.nvim',
  'lewis6991/gitsigns.nvim',
  'github/copilot.vim',
  -- {
  --   'zbirenbaum/copilot.lua',
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({})
  --   end,
  -- },
})

