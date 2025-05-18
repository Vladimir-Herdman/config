-- Clear highlights
vim.keymap.set("n", "<Leader>n", "<cmd>noh<CR>", { desc = "turn off hlsearch to clear search highlights" })

-- Enter expression register
vim.keymap.set("n", "<Leader>c", "i<C-r>=", { desc = "Enter calculation result" })

-- Substitutions
vim.keymap.set("n", "s", "<cmd>&&<CR>", { desc = "Repeat last substitution with flags" })
vim.keymap.set("n", "<Leader>sw", ":%s/\\<<C-r><C-w>\\>//gcI<Left><Left><Left><Left>", { desc = "Replace current word under cursor" })

-- jump on screen buffers
vim.keymap.set("n", "<Leader>h", "<C-w>h", { desc = "jump to left onscreen window/buffer" })
vim.keymap.set("n", "<Leader>j", "<C-w>j", { desc = "jump to below onscreen window/buffer" })
vim.keymap.set("n", "<Leader>k", "<C-w>k", { desc = "jump to above onscreen window/buffer" })
vim.keymap.set("n", "<Leader>l", "<C-w>l", { desc = "jump to right onscreen window/buffer" })

-- split screen
vim.keymap.set("n", "<Leader>sv", "<cmd>vsplit<CR>", { desc = "Split screen vertically" })
vim.keymap.set("n", "<Leader>sh", "<cmd>split<CR>", { desc = "Split screen horizontally" })

-- line movements
vim.keymap.set("n", "<Up>", "<Cmd>m -2<CR>")
vim.keymap.set("n", "<Down>", "<Cmd>m +1<CR>")
vim.keymap.set("n", "<Left>", "<Cmd>tabprevious<CR>")
vim.keymap.set("n", "<Right>", "<Cmd>tabNext<CR>")

vim.keymap.set("n", "<C-CR>", "o<Esc>k", { desc = "newline below without entering insert mode" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "When in visual mode, move highlighted up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "When in visual mode, move highlighted down" })

-- Function stuff and lsp interaction
vim.keymap.set("n", "<Leader>fd", vim.lsp.buf.definition, { desc = "Go to function definition" })
vim.keymap.set("n", "<Leader>fh", vim.lsp.buf.hover, { desc = "Displays hover information" })
vim.keymap.set("n", "<Leader>fs", vim.lsp.buf.signature_help, { desc = "Displays signature information" })
vim.keymap.set("n", "<Leader>gw", function() vim.diagnostic.jump({ count=1, float=true }) end, { desc = "Go to warning (diagnostic)" })
vim.keymap.set("n", "<Leader>fw", vim.lsp.buf.code_action, { desc = "Fix warning" })
--grn:  Rename variable and it's references (vim.lsp.buf.rename)
--grr:  Get all variable references in file (vim.lsp.buf.references)
--gri:  Get implementation of symbol under cursor, so definition location of word under cursor (vim.diagnostic.implementation)
--gra:  Get all actions on this code piece, fix warning options (vim.lsp.buf.code_action)
