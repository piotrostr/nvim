require('go').setup()

-- Run gofmt + goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

-- set go ident and tab size
vim.api.nvim_exec([[ autocmd FileType go setlocal shiftwidth=2 tabstop=2 autoindent smartindent cindent ]], false)

vim.api.nvim_create_autocmd("FileType", {
 pattern = "go",
 callback = function()
   vim.bo.indentexpr = ""
 end
})

require'nvim-treesitter.configs'.setup {
 indent = {
   enable = true,
   disable = { "go" }  -- add this line to disable for Go
 },
}

