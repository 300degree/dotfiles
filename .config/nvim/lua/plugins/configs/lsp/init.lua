local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

require("plugins.configs.lsp.mason")
require("plugins.configs.lsp.lsp_config")
