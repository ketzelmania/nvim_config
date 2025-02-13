-- general
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<esc>", ":noh<return><esc>")
vim.keymap.set("v", "<leader>/", "yq/p<cr>")
vim.cmd([[nnoremap dm :execute 'delmarks '.nr2char(getchar())<cr>]])
vim.keymap.set("n", "<leader>d", "<cmd>Neogen<cr>")
vim.keymap.set({ "i", "s" }, "<C-L>", function()
	require("luasnip").jump(1)
end, { silent = true })
vim.keymap.set("n", "<leader>bn", "<cmd>enew<cr>")

-- remap registers
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "c", '"_c')

vim.keymap.set("v", "d", '"+d')
vim.keymap.set("v", "x", '"+x')
vim.keymap.set("v", "c", '"+c')

vim.keymap.set({ "n", "v" }, "y", '"+y')
vim.keymap.set("n", "p", '"+p')

-- switch windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- open tabs
vim.keymap.set("n", "<leader>re", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeOpen<CR>")

-- buffers
vim.keymap.set("n", "<leader>x", "<cmd>bd<CR>")
vim.keymap.set("n", "<leader>n", "<cmd>bn<CR>")

-- telescope find
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")

-->> image handling

-- paste image
vim.keymap.set("n", "<leader>ip", "<cmd>PasteImage<CR>")

-- refresh images
vim.keymap.set("n", "<leader>ir", function()
	vim.cmd([[lua require("image").clear()]])
	vim.cmd("edit!")
	print("Images refreshed")
end, { desc = "Refresh images" })

-- clear images
vim.keymap.set("n", "<leader>ic", function()
	vim.cmd([[lua require("image").clear()]])
	print("Images cleared")
end, { desc = "Clear images" })
