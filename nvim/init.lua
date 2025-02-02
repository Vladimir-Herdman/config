--requires
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
vim.cmd("filetype plugin indent on")
vim.opt.signcolumn = "yes:1"

-- key bindings
    -- Clear highlights
vim.keymap.set("n", "<leader>n", "<cmd>noh<CR>", { desc = "turn off hlsearch to clear search highlights" })
    -- jump on screen buffers
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "jump to left onscreen window/buffer" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "jump to below onscreen window/buffer" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "jump to above onscreen window/buffer" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "jump to right onscreen window/buffer" })
    -- Function stuff and lsp interaction
vim.keymap.set("n", "<leader>fd", vim.lsp.buf.definition, { desc = "Go to function definition" })
vim.keymap.set("n", "<leader>fh", vim.lsp.buf.hover, { desc = "Displays hover information" })
vim.keymap.set("n", "<leader>fs", vim.lsp.buf.signature_help, { desc = "Displays signature information" })
vim.keymap.set("n", "<leader>gw", vim.diagnostic.goto_next, { desc = "Go to warning (diagnostic)" })
vim.keymap.set("n", "<leader>fw", vim.lsp.buf.code_action, { desc = "Fix warning" })
vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "Rename variable" })
vim.keymap.set("n", "grr", vim.lsp.buf.references, { desc = "Get all variable references" })

-- Buffer
vim.api.nvim_create_autocmd("BufAdd", {
    callback = function()
        local buffers_list = vim.api.nvim_list_bufs()
        local hidden_buffers = {}
        local hidden_count = 0
        local max_hidden_buffers = 5

        -- Get all hidden buffers
        for _, buf in ipairs(buffers_list) do
            if (vim.api.nvim_buf_is_valid(buf) and vim.fn.buflisted(buf) == 1 and #vim.fn.win_findbuf(buf) == 0) then
                table.insert(hidden_buffers, vim.fn.getbufinfo(buf)[1])
                hidden_count = hidden_count + 1
            end
        end

        -- Sort hidden buffers by oldest
        -- Delete oldest if over limit
        if (#hidden_buffers > max_hidden_buffers) then
            table.sort(hidden_buffers, function(a, b)
                return a.lastused < b.lastused
            end)

            for i=2,5 do
                vim.api.nvim_buf_delete(hidden_buffers[i].bufnr, { force = true })
            end
        end
    end
})
vim.api.nvim_create_autocmd("FileType", {  -- This is to keep telescope functionality while using pear-tree enter
    pattern = "TelescopePrompt",
    callback = function()
        vim.b.pear_tree_enabled = false
    end,
})

-- Terminal
vim.api.nvim_create_autocmd("TermOpen", {  -- Make terminal buffer look more terminal-like
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Leave terminal mode while in terminal" })
vim.keymap.set("n", "<leader>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 10)
end, { desc = "Create small terminal at bottom of screen" })
