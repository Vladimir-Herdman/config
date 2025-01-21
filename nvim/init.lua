-- requires
require("config.lazy")

-- text
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.incsearch = true
vim.opt.syntax = "on"

-- windows/screens
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 999
vim.opt.virtualedit = "block"

vim.cmd([[
    filetype plugin indent on
]])

-- key bindings
vim.keymap.set("n", "<leader>n", "<cmd>noh<CR> | <cmd>hls<CR>")  --Turn off/on hlsearch to clear highlights
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")
