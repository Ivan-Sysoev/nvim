-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- [[ Custom keymaps ]]
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Enter Ex mode" })
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save file" })

-- Copy/Paste buffers
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy into system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Select and copy into system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without copying" })

-- NO ARROWS!!!
vim.keymap.set({ "n", "v", "i" }, "<left>", '<cmd>echo "Use h to move!!"<CR>', { desc = "left arrow helper" })
vim.keymap.set({ "n", "v", "i" }, "<right>", '<cmd>echo "Use l to move!!"<CR>', { desc = "right arrow helper" })
vim.keymap.set({ "n", "v", "i" }, "<up>", '<cmd>echo "Use k to move!!"<CR>', { desc = "up arrow helper" })
vim.keymap.set({ "n", "v", "i" }, "<down>", '<cmd>echo "Use j to move!!"<CR>', { desc = "down arrow helper" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
