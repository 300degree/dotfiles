local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

lspconfig.gopls.setup({})
lspconfig.clangd.setup({})
lspconfig.pyright.setup({})
lspconfig.docker_compose_language_service.setup({})
