local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {"python"},
})

lspconfig.clangd.setup{
  capabilities = {
    offsetEncoding = {"utf-16"}
  },
}
lspconfig.solargraph.setup{
  settings = {
    solargraph = {
      -- disabling diagnostic by solargraph: using rubocop
      diagnostics = false
    }
  }
}


