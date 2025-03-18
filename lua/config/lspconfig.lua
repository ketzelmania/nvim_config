local lspconfig = require("lspconfig")

-- default config servers
local servers = {
	"pyright",
	"ts_ls",
	"html",
	"cssls",
	"lua_ls",
	--"luau_lsp",
	"texlab",
	"jdtls",
	"zls",
	"clangd",
	"gopls",
}
-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = vim.lsp.protocol.make_client_capabilities(),
	})
end

-- rust with clippy
lspconfig.rust_analyzer.setup({
	capabilities = vim.lsp.protocol.make_client_capabilities(),
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "clippy",
			},
		},
	},
})
