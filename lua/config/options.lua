-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- [[ Options ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.smartindent = true

vim.opt.termguicolors = true

vim.o.showmode = false

vim.o.clipboard = ""

vim.o.breakindent = true
vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

-- [mark] little errors indicators
vim.o.signcolumn = "yes"

vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- [mark] ctrl+w+v
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = "  ", trail = " ", nbsp = "␣" }

vim.o.inccommand = "split"

-- [mark] current line highlighting
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- [mark] confirm message
vim.o.confirm = true

-- Disable Ex after projects opens
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
