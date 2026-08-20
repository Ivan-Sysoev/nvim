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

-- Do not copy x to clipboard
vim.keymap.set({ "n", "x" }, "x", '"_x')

-- Shift+q for repeating last macros
vim.keymap.set("n", "Q", function()
	local reg = vim.g.last_recorded_reg or "q"
	vim.cmd("normal! @" .. reg)
end, { desc = "Repeat last macros" })

-- vim.keymap.set("v", '<leader>"', [[gsa"]])

-- vim.keymap.set("n", "<leader>ci", function()
-- 	vim.lsp.buf.code_action({
-- 		apply = true,
-- 		context = { only = { "source.organizeIncludes" } },
-- 	})
-- end, { desc = "Clangd: Organize Includes" })

-- vim.keymap.set("n", "<leader>ci", function()
-- 	vim.lsp.buf.code_action({
-- 		filter = function(action)
-- 			return action.title == "Clangd: Organize includes"
-- 		end,
-- 		apply = true,
-- 	})
-- end, { desc = "Organize #includes (clangd)" })

vim.keymap.set("n", "<leader>cd", function()
	vim.fn.jobstart({ "open", "-R", vim.api.nvim_buf_get_name(0) }, { detach = true })
end, { desc = "Open current firectory in finder" })

-- Switching Root Dir with cwd in standart LazyVim keymaps
-- TODO : Remap <leader>e with <leader>E and <leader>f with <leader>F

vim.keymap.set("n", "<leader>f", function()
	require("telescope.builtin").find_files({
		hidden = true,
		no_ignore = true,
	})
end)
