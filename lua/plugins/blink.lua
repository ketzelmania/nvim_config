return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },

	-- use a release tag to download pre-built binaries
	version = "*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	init = function()
		require("luasnip/loaders/from_vscode").lazy_load({
			paths = { "~/.local/share/nvim/lazy/friendly-snippets", "~/.config/nvim/snippets" },
		})
	end,

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = {
			["<M-c>"] = { "show" },
			["<S-CR>"] = { "hide" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<PageDown>"] = { "scroll_documentation_down" },
			["<PageUp>"] = { "scroll_documentation_up" },
		},

		snippets = {
			preset = "luasnip",
		},

		completion = {
			menu = {
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
				},

				border = "rounded",
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				window = {
					border = "rounded",
				},
			},

			keyword = {
				range = "full",
			},

			list = {
				selection = {
					preselect = function(ctx)
						return ctx.mode ~= "cmdline"
					end,
					auto_insert = function(ctx)
						return ctx.mode ~= "cmdline"
					end,
				},
			},
		},

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "normal",

			kind_icons = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "",
			},
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			transform_items = function(_, items)
				return items
			end,
			default = { "path", "snippets", "lsp", "buffer" },
			providers = {
				snippets = {
					name = "Snippets",
					module = "blink.cmp.sources.snippets",
					score_offset = 3,
					max_items = 3,

					-- For `snippets.preset == 'luasnip'`
					opts = {
						-- Whether to use show_condition for filtering snippets
						use_show_condition = true,
						-- Whether to show autosnippets in the completion list
						show_autosnippets = false,
					},
				},
				path = {
					name = "Path",
					module = "blink.cmp.sources.path",
					score_offset = 100000,
					opts = {
						show_hidden_files_by_default = true,
					},
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
