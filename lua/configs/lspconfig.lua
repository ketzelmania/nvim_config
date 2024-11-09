-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- default config servers
local servers = { "ts_ls", "html", "cssls", "clangd", "lua_ls", "texlab" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- pyright
do
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
  lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = nvlsp.on_attach,
  }
end

-- omnisharp specific
do
  local pid = vim.fn.getpid()
  local omnisharp_bin = "/home/kessel/software/omnisharp/run"

  lspconfig.omnisharp.setup {
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
    root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln"),
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
