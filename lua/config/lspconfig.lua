local lspconfig = require("lspconfig")

-- default config servers
local servers = {
	"pyright",
	"ts_ls",
	"html",
	"cssls",
	"clangd",
	"lua_ls",
	"luau_lsp",
	"texlab",
}
-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = vim.lsp.protocol.make_client_capabilities(),
	})
end

-- pyright
--[[
do
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
	lspconfig.pyright.setup({
		capabilities = capabilities,
	})
end
]]
