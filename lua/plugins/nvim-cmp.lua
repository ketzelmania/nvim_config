return {
	"hrsh7th/nvim-cmp",
	event = { "BufEnter", "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-path",
		"f3fora/cmp-spell",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"saadparwaiz1/cmp_luasnip",
		"lukas-reineke/cmp-under-comparator",
		"quangnguyen30192/cmp-nvim-ultisnips",
	},

	config = function()
		vim.cmd([[
		    augroup NvimCmp
		    au!
		    au FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
		    augroup END
		]])

		local kind_icons = {
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
		}
		local cmp = require("cmp")
		local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					vim.fn["UltiSnips#Anon"](args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = {
				["<cr>"] = cmp.mapping(function(fallback)
					cmp_ultisnips_mappings.compose({ "expand" })(fallback)
				end),
				["<Tab>"] = cmp.mapping(function(fallback)
					cmp_ultisnips_mappings.jump_forwards(fallback)
				end, {
					"i",
					"s", --[[ "c" (to enable the mapping in command mode) ]]
				}),
				["<Down>"] = cmp.mapping(function(fallback)
					cmp_ultisnips_mappings.jump_forwards(fallback)
				end, {
					"i",
					"s", --[[ "c" (to enable the mapping in command mode) ]]
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					cmp_ultisnips_mappings.jump_backwards(fallback)
				end, {
					"i",
					"s", --[[ "c" (to enable the mapping in command mode) ]]
				}),
				["<Up>"] = cmp.mapping(function(fallback)
					cmp_ultisnips_mappings.jump_backwards(fallback)
				end, {
					"i",
					"s", --[[ "c" (to enable the mapping in command mode) ]]
				}),
			},
			formatting = {
				format = function(entry, item)
					item.kind = kind_icons[item.kind] .. " " .. item.kind
					-- set a name for each source
					item.menu = ({
						spell = "[Spell]",
						buffer = "[Buffer]",
						calc = "[Calc]",
						emoji = "[Emoji]",
						nvim_lsp = "[LSP]",
						path = "[Path]",
						look = "[Look]",
						treesitter = "[treesitter]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[Latex]",
						cmp_tabnine = "[Tab9]",
					})[entry.source.name]
					return item
				end,
			},
			sources = cmp.config.sources({
				{ name = "ultisnips", max_item_count = 3 },
				{ name = "nvim_lsp", max_item_count = 5 },
				{ name = "buffer", max_item_count = 5 },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
		})
	end,
}
