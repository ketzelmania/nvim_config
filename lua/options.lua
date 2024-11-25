vim.o.cursorlineopt = "both"
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 3
vim.o.undodir = "/home/kessel/.nvim/undo-dir"
vim.o.undofile = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.conceallevel = 2

vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_math = true

vim.cmd([[se cursorline]])
vim.cmd([[se cursorcolumn]])
vim.cmd([[filetype plugin on]])

vim.g.gruvbox_baby_telescope_theme = 1
vim.g.gruvbox_baby_transparent_mode = 1
vim.g.gruvbox_baby_comment_style = "NONE"
vim.g.gruvbox_baby_keyword_style = "NONE"

vim.cmd([[colorscheme gruvbox-baby]])

-- go to last line when opening file
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

--vim.cmd([[colorscheme gruvbox]])

--[[
vim.g.gruvbox_material_enable_italic = 0
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_foreground = "soft"
vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_ui_contrast = "high"

vim.cmd([[colorscheme gruvbox-material]]
