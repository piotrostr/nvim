local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
require("mason-lspconfig").setup({
    automatic_installation = true,
})
if (not status2) then return end

mason.setup({})

lspconfig.setup {}
