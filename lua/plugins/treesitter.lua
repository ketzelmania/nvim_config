return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"tadmccorkle/markdown.nvim",
	},
	opts = {
		ensure_installed = {
			"vim",
			"lua",
			"vimdoc",
			"html",
			"css",
			"python",
			"java",
		},
	},
	event = "BufEnter",

	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"markdown",
				"markdown_inline", --[[ other parsers you need ]]
				"rust",
				"latex",
			},
			auto_install = true,
			markdown = {
				enable = true,
				-- configuration here or nothing for defaults
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},
			ident = {
				enable = false,
			},
		})
	end,
}
