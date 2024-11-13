require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<leader>ee", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>")
--vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')

-- image handling

-- paste image
vim.keymap.set("n", "<leader>ip", "<cmd>PasteImage<CR>")

-- refresh images
vim.keymap.set("n", "<leader>ir", function()
  vim.cmd [[lua require("image").clear()]]
  vim.cmd "edit!"
  print "Images refreshed"
end, { desc = "Refresh images" })

-- clear images
vim.keymap.set("n", "<leader>ic", function()
  vim.cmd [[lua require("image").clear()]]
  print "Images cleared"
end, { desc = "Clear images" })
