return {
	"nvim-treesitter/nvim-treesitter",
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
		vim.cmd([[TSEnable highlight]])
	end,
}
