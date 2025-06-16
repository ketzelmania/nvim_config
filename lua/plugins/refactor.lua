return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	lazy = false,
	opts = {},
	config = function()
		vim.keymap.set("x", "<leader>rf", ":Refactor extract ")

		vim.keymap.set("x", "<leader>rn", ":Refactor extract_var ")

		vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

		vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")

		vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
		vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")
	end,
}
