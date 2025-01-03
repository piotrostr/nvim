local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    --     "tsx",
    --     "solidity",
    --     "toml",
    --     "json",
    --     "yaml",
    --     "css",
    --     "lua",
    --     "go",
    --     "python"
  },
  autotag = {
    enable = true,
  },
}

-- uncomment below on macos if cannot compile
-- sometimes might need to :TSInstall <parser> manually as well for it to work

-- ignore if on linux
-- if vim.fn.has("mac") == 1 then
--   require 'nvim-treesitter.install'.compilers = { 'aarch64-apple-darwin21-gcc-11' }
-- end

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

parser_config.move = {
  install_info = {
    url = "https://github.com/tree-sitter-grammars/tree-sitter-move",
    files = {"src/parser.c"},
    branch = "saving",
  },
  filetype = "move",
}

