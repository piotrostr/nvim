--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "rounded",
  }
)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-i>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<Cmd>Telescope lsp_references<CR>', opts)
  buf_set_keymap('n', '<space>e', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- buf_set_keymap('n', 'q', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- disable snippets
capabilities.textDocument.completion.completionItem.snippetSupport = false

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})

--vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
vim.cmd [[
  augroup fmt
    autocmd!
    au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
  augroup END
]]

-- typescript

nvim_lsp.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
}

nvim_lsp.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- nvim_lsp.tailwindcss.setup {}

-- bash
nvim_lsp.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- docker
nvim_lsp.dockerls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- golang
nvim_lsp.golangci_lint_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- yaml
nvim_lsp.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      format = {
	enable = true,
	indentSequences = false,
      },
      schemas = {
        kubernetes = { "deployment.yaml", "manifest.yaml" },
      }
    }
  }
}

-- terraform
-- first set ftplugin to see terraform
vim.cmd [[
  augroup terraform
    autocmd!
    autocmd BufNewFile,BufRead *.tf set filetype=terraform
  augroup END
]]
nvim_lsp.terraformls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
nvim_lsp.tflint.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

configs.solidity = {
  default_config = {
    cmd = {'nomicfoundation-solidity-language-server', '--stdio'},
    filetypes = { 'solidity' },
    root_dir = lspconfig.util.find_git_ancestor,
    single_file_support = true,
  },
}
nvim_lsp.solidity.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- json
nvim_lsp.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- python
nvim_lsp.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- java (ugh)
-- require('jdtls').start_or_attach({
--   cmd = { 'jdtls' },
--   root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
-- })
-- nvim_lsp.jdtls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities
-- }


-- markdown, tex
-- nvim_lsp.ltex.setup {
--   on_attach = on_attach,
--   capabilities = capabilities
-- }

-- protobufs
nvim_lsp.bufls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- rust
nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy"
      },
      assist = {
	importGranularity = "module",
	importPrefix = "self",
      },
      cargo = {
	loadOutDirsFromCheck = true
      },
      procMacro = {
	enable = true
      }
    }
  }
}

nvim_lsp.taplo.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- cc
capabilities.offsetEncoding = { "utf-16" }
nvim_lsp.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp" }
}

-- angular & html & sass
-- nvim_lsp.angularls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities
-- }

nvim_lsp.html.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.svelte.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- php
nvim_lsp.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
	globals = { "vim" }
      }
    }
  }
}

nvim_lsp.zls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.omnisharp.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- format on save for rust
vim.cmd [[
  augroup rust
	autocmd!
	autocmd BufWritePre *.rs lua vim.lsp.buf.format()
  augroup END
]]

-- format on save for zig
vim.cmd [[
  augroup zig
	autocmd!
	autocmd BufWritePre *.zig lua vim.lsp.buf.format()
  augroup END
]]

nvim_lsp.vuels.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.nimls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
