return {
	"Prometheus1400/markdown-latex-render.nvim",
	dependencies = { "3rd/image.nvim", "nvim-lua/plenary.nvim" },
	build = "make install",
	version = "*",

	lazy = true,
	ft = "markdown",

	opts = {
		render = {
			appearance = {
				fg = "default",
				bg = nil,
				transparent = true,
				fontsize = 14,
				ppi = 224,
			},
			on_open = true,
			on_write = "render",
			usetex = true,
		},
	},
}
