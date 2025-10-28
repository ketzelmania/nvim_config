-- default config servers
local servers = {
	"pyright",
	"ts_ls",
	"html",
	"cssls",
	"lua_ls",
	"texlab",
	"jdtls",
	"zls",
	"clangd",
	"gopls",
	"cssls",
}
-- lsps with default config
for _, lsp in ipairs(servers) do
	vim.lsp.enable(lsp)
end

vim.lsp.config("luau_lsp", {
	cmd = { "luau-lsp", "lsp", "--definitions=~/globalTypes.d.lua" },
	settings = {
		platform = {
			type = "roblox",
		},
		types = {
			roblox_security_level = "PluginSecurity",
			--definitionFiles = { "~/globalTypes.d.lua" },
		},
		sourcemap = {
			enabled = true,
			rojo_project_file = "default.project.json",
			sourcemap_file = "sourcemap.json",
		},
	},
})
vim.lsp.enable("luau_lsp")

-- rust with clippy
vim.lsp.config("rust_analyzer", {
	capabilities = vim.lsp.protocol.make_client_capabilities(),
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "clippy --fix",
			},
		},
	},
})
vim.lsp.enable("rust_analyzer")
