return {
	"simrat39/rust-tools.nvim",
	lazy = true,
	ft = "rs",

	config = function()
		require("rust-tools").setup({})
	end,
}
