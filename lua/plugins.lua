-- Configuration table for lazy.nvim
require("lazy").setup({
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  },
  'ellisonleao/gruvbox.nvim',
  'ray-x/go.nvim',
  'L3MON4D3/LuaSnip', -- dep
  'ray-x/guihua.lua', -- dep
  'dinhhuy258/git.nvim', -- dep
  'nvim-lua/plenary.nvim', -- dep
  'nvim-lualine/lualine.nvim', -- Statusline
  'onsails/lspkind-nvim', -- vscode-like pictograms
  'navarasu/onedark.nvim',
  {
    "FabijanZulj/blame.nvim",
     config = function()
       require("blame").setup()
     end,
  },

  { 'hrsh7th/nvim-cmp',
    dependencies =  {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
    },
    lazy = false,
  },
  {
    "MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
        require("inlay-hints").setup({
	    autocmd = { enable = true }
	})
    end
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
  },
  'neovim/nvim-lspconfig',
  'jose-elias-alvarez/null-ls.nvim',
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
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  'aserowy/tmux.nvim',
  'lewis6991/gitsigns.nvim',
  { 'christoomey/vim-tmux-navigator', lazy=false},
  'github/copilot.vim',
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
	background_colour = "#000000",
	render = "compact",
	level = 3,
	timeout = 1500
      })
    end
  },
  {
    "lewis6991/hover.nvim",
    config = function()
      require("hover").setup({
        init = function()
          require("hover.providers.lsp")
          require('hover.providers.gh')
          require('hover.providers.gh_user')
          -- require('hover.providers.jira')
          -- require('hover.providers.man')
          -- require('hover.providers.dictionary')
        end,
        preview_opts = {
	  border = "rounded",
        },
        preview_window = false,
        mouse_delay = 1000,
	title = false,
      })

      -- Setup keymaps
      vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
      vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})

      -- Mouse support
      vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)" })
      vim.o.mousemoveevent = true
    end,
  },
  {
    "pwntester/octo.nvim",
    config = function()
      --require("octo").setup()
    end,
  },
  {
    "yetone/avante.nvim",
    build = "make",
    event = "VeryLazy",
    opts = {
      -- add any opts here
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below is optional, make sure to setup it properly if you have lazy=true
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
})

vim.opt.splitkeep = "screen"
vim.opt.laststatus = 3
vim.g.mapleader = " "
