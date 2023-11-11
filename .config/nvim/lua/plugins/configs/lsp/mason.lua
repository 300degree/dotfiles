local servers = {
    "tsserver",
    "pyright",
    "gopls",
    "clangd",
    "docker_compose_language_service"
}

local settings = {
    ui = {
        icons = {
            package_isntalled = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})
