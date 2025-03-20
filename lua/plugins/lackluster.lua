return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		-- !must called setup() before setting the colorscheme!
		require("lackluster").setup({
			tweak_highlight = {
				["@keyword"] = {
					overwrite = true,
					italic = true,
				},
				["@function"] = {
					overwrite = true,
					bold = true,
				},
				["@type"] = {
					overwrite = true,
					italic = true,
				},
				["@lsp.typemod.keyword.documentation"] = {
					overwrite = true,
					fg = "#789978",
				},
			},
			tweak_background = {
				normal = "none",
			},
		})
		--vim.cmd.colorscheme("lackluster")
		--vim.cmd.colorscheme("lackluster-hack") -- my favorite
		vim.cmd.colorscheme("lackluster-mint")
	end,
}
