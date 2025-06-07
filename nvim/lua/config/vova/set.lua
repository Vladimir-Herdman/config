-- text
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.incsearch = true
vim.opt.syntax = "on"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.schedule(function() vim.opt.clipboard = "unnamedplus" end)
vim.o.breakindent = true

-- text folding
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.opt.foldcolumn = "0"
vim.opt.fillchars:append({fold = "~"})

-- windows/screens
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 999
vim.opt.virtualedit = "block"
vim.cmd("filetype plugin indent on")
vim.opt.signcolumn = "yes:1"

-- file
vim.o.updatetime = 1000
vim.o.confirm = true
