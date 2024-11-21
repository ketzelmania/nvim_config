local lspconfig = require("lspconfig")

-- default config servers
local servers = {
	--"ruff",
	"ts_ls",
	"html",
	"cssls",
	"clangd",
	"lua_ls",
	"texlab",
}
-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({})
end

-- pyright
do
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
	lspconfig.pyright.setup({
		capabilities = capabilities,
	})
end
