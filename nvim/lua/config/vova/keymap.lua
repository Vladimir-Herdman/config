-- Clear highlights
vim.keymap.set("n", "<Leader>n", "<cmd>noh<CR>", { desc = "turn off hlsearch to clear search highlights" })

-- Enter expression register
vim.keymap.set("n", "<Leader>c", "i<C-r>=", { desc = "Enter calculation result" })

-- Substitutions
vim.keymap.set("n", "s", "<cmd>&&<CR>", { desc = "Repeat last substitution with flags" })
vim.keymap.set("n", "<Leader>sg", ":%s/\\<<C-r><C-w>\\>//gcI<Left><Left><Left><Left>", { desc = "Globally replace under cursor" })
vim.keymap.set("n", "ciw", "\"_ciw", { desc = "ciw doesn't interact with unnamed register" })

-- jump on screen buffers
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "jump to left onscreen window/buffer" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "jump to below onscreen window/buffer" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "jump to above onscreen window/buffer" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "jump to right onscreen window/buffer" })

-- split screen
vim.keymap.set("n", "<Leader>sv", "<cmd>vsplit<CR>", { desc = "Split screen vertically" })
vim.keymap.set("n", "<Leader>sh", "<cmd>split<CR>", { desc = "Split screen horizontally" })

-- line movements
vim.keymap.set("n", "<Up>", "<Cmd>m -2<CR>")
vim.keymap.set("n", "<Down>", "<Cmd>m +1<CR>")
vim.keymap.set("n", "<Left>", "<Cmd>tabprevious<CR>")
vim.keymap.set("n", "<Right>", "<Cmd>tabNext<CR>")

vim.keymap.set("n", "<C-CR>", "o<Esc>k", { desc = "newline below without entering insert mode" })

vim.keymap.set("n", "<Leader>;", "A;<Esc>o", { desc = "enter ; at end of line, start new one" })
vim.keymap.set("n", "<Leader>,", "A,<Esc>o", { desc = "enter , at end of line, start new one" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "When in visual mode, move highlighted up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "When in visual mode, move highlighted down" })

-- Function stuff and lsp interaction
vim.keymap.set("n", "fd", vim.lsp.buf.definition, { desc = "Go to function definition" })
vim.keymap.set("n", "fh", vim.lsp.buf.hover, { desc = "Displays hover information" })
vim.keymap.set("n", "fs", vim.lsp.buf.signature_help, { desc = "Displays signature information" })
vim.keymap.set("n", "<Leader>gw", function() vim.diagnostic.jump({ count=1, float=true }) end, { desc = "Go to warning (diagnostic)" })
vim.keymap.set("n", "fw", vim.lsp.buf.code_action, { desc = "Fix warning" })
--grn:  Rename variable and it's references (vim.lsp.buf.rename)
--grr:  Get all variable references in file (vim.lsp.buf.references)
--gri:  Get implementation of symbol under cursor, so definition location of word under cursor (vim.diagnostic.implementation)
--gra:  Get all actions on this code piece, fix warning options (vim.lsp.buf.code_action)

vim.keymap.set("n", "gt", "<C-]>", { desc = "shortcut gt to ctrl-]" })

vim.keymap.set("n", "<Leader>w", "<Cmd>w<CR>", { desc = "faster :w" })
vim.keymap.set("n", "<Leader>q", "<Cmd>q<CR>", { desc = "faster :q" })
vim.keymap.set("n", "<Leader>x", "<Cmd>wq<CR>", { desc = "faster :wq" })
vim.keymap.set("n", "H", "^", { desc = "Move to line beginning" })
vim.keymap.set("n", "L", "$", { desc = "Move to line end" })
