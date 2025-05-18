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
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- text folding
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.opt.foldcolumn = "0"
vim.opt.fillchars:append({fold = "~"})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if (client and client:supports_method("textDocument/foldingRange")) then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
        end
    end,
})

vim.keymap.set("n", "<Up>", "<Cmd>m -2<CR>")
vim.keymap.set("n", "<Down>", "<Cmd>m +1<CR>")
vim.keymap.set("n", "<Left>", "<Cmd>tabprevious<CR>")
vim.keymap.set("n", "<Right>", "<Cmd>tabNext<CR>")

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
    -- Enter newline
vim.keymap.set("n", "<C-CR>", "o<Esc>k", { desc = "newline below without entering insert mode" })
    -- Enter expression register
vim.keymap.set("n", "<Leader>c", "i<C-r>=", { desc = "Enter calculation result" })
    -- Repeat last substitution
vim.keymap.set("n", "s", "<cmd>&&<CR>", { desc = "Repeat last substitution with flags" })
    -- jump on screen buffers
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "jump to left onscreen window/buffer" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "jump to below onscreen window/buffer" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "jump to above onscreen window/buffer" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "jump to right onscreen window/buffer" })
    -- split screen
vim.keymap.set("n", "<Leader>sv", "<cmd>vsplit<CR>", { desc = "Split screen vertically" })
vim.keymap.set("n", "<Leader>sh", "<cmd>split<CR>", { desc = "Split screen horizontally" })
    -- Function stuff and lsp interaction
vim.keymap.set("n", "<leader>fd", vim.lsp.buf.definition, { desc = "Go to function definition" })
vim.keymap.set("n", "<leader>fh", vim.lsp.buf.hover, { desc = "Displays hover information" })
vim.keymap.set("n", "<leader>fs", vim.lsp.buf.signature_help, { desc = "Displays signature information" })
vim.keymap.set("n", "<leader>gw", vim.diagnostic.goto_next, { desc = "Go to warning (diagnostic)" })
vim.keymap.set("n", "<leader>fw", vim.lsp.buf.code_action, { desc = "Fix warning" })
--grn:  Rename variable and it's references (vim.lsp.buf.rename)
--grr:  Get all variable references in file (vim.lsp.buf.references)
--gri:  Get implementation of symbol under cursor, so definition location of word under cursor (vim.diagnostic.implementation)
--gra:  Get all actions on this code piece, fix warning options (vim.lsp.buf.code_action)

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

--Reinitialize buffer markdown syntax highlighting with treesitter
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.defer_fn(function()
            vim.cmd("TSDisable highlight")
            vim.cmd("TSEnable highlight")
        end, 100)
        vim.opt_local.conceallevel = 2
    end
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
    local current_buf_dir = vim.fn.expand("%:p:h")
    current_buf_dir = current_buf_dir:gsub(" ", "\\ ")
    vim.cmd.vnew()
    vim.fn.termopen("zsh -c 'cd " .. current_buf_dir .. " && zsh'")
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 10)
    vim.cmd("call nvim_input(\"i\")")
end, { desc = "Create small terminal at bottom of screen" })

-- Change to current buffer md file in obsidian
vim.keymap.set("n", "<leader>ob", function()
    local filename = vim.fn.expand("%:p")
    if (string.sub(filename, -2, -1) == "md") then
        local vault = "/Users/vova/Notes/"
        filename = filename:gsub(vault, "")
        vim.fn.system("open 'obsidian://open?file=" .. filename .. "'")
    end
end)
