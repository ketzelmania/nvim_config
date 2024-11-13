require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both"
o.relativenumber = true
o.numberwidth = 3

vim.opt.tabstop = 8 -- Always 8 (see :h tabstop)
vim.opt.softtabstop = 4 -- What you expecting
vim.opt.shiftwidth = 4 -- What you expecting
vim.opt.expandtab = true -- Works without this
vim.opt.conceallevel = 2
