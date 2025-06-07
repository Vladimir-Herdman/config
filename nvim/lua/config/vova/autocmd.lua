-- text folding setup
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if (client and client:supports_method("textDocument/foldingRange")) then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
        end
    end,
})

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

-- Telescope and peartree
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
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Leave terminal mode while in terminal" })

vim.keymap.set("n", "<Leader>st", function()
    local current_buf_dir = vim.fn.expand("%:p:h")
    current_buf_dir = current_buf_dir:gsub(" ", "\\ ")
    vim.cmd.vnew()
    vim.fn.termopen("zsh -c 'cd " .. current_buf_dir .. " && zsh'")
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 10)
    vim.cmd("call nvim_input(\"i\")")
end, { desc = "Create small terminal at bottom of screen" })

-- Change to current buffer md file in obsidian
vim.keymap.set("n", "<Leader>ob", function()
    local filename = vim.fn.expand("%:p")
    if (string.sub(filename, -2, -1) == "md") then
        local vault = "/Users/vova/Notes/"
        filename = filename:gsub(vault, "")
        vim.fn.system("open 'obsidian://open?file=" .. filename .. "'")
    end
end)
