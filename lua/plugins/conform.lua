local home = "/home/met"

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				luau = { "stylua" },
				python = { "black" },
				latex = { "latexindent" },
				cpp = { "clangd" },
				rust = { "rustfmt" },
				java = { "google-java-format" },
				c = { "clang-format" },
				go = { "crlfmt" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
			formatters = {
				["google-java-format"] = {
					prepend_args = { "--aosp", "--skip-javadoc-formatting" },
				},
				["clang-format"] = {
					--args = '$FILENAME',
					--append_args = { '--style="{IndentWidth: 4, ReflowComments: false}"' },
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
