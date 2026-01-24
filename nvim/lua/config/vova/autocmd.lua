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

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"html", "grads", "javascript", "css", "typescriptreact"},
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

-- Terminal
vim.api.nvim_create_autocmd("TermOpen", {  -- Make terminal buffer look more terminal-like
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Leave terminal mode while in terminal" })
--vim.keymap.set("t", "jj", "<c-\\><c-n>", { desc = "Leave terminal mode while in terminal" })

vim.keymap.set("n", "<Leader>st", function()
    local current_buf_dir = vim.fn.expand("%:p:h")
    current_buf_dir = current_buf_dir:gsub(" ", "\\ ")
    vim.cmd.vnew()
    vim.fn.termopen("zsh -c 'cd " .. current_buf_dir .. " && zsh'")
    vim.cmd.wincmd("J")
    vim.opt_local.laststatus = 0
    vim.opt_local.winfixheight = true
    vim.api.nvim_win_set_height(0, 10)
    vim.cmd("call nvim_input(\"i\")")
end, { desc = "Create small terminal at bottom of screen" })

-- Change to current buffer md file in obsidian
vim.keymap.set("n", "<Leader>ob", function()
    local filename = vim.fn.expand("%:p")
    if (string.sub(filename, -2, -1) == "md") then
        local vault = "/Users/vova/notes/"
        filename = filename:gsub(vault, "")
        vim.fn.system("open 'obsidian://open?file=" .. filename .. "'")
    end
end)

-- Quixkfix List
vim.api.nvim_create_autocmd('Filetype', {
    pattern = 'qf',
    callback = function()
        if (not _G.ORIGINAL_CURSORLINE_HL) then
            _G.ORIGINAL_CURSORLINE_HL = vim.api.nvim_get_hl(0, { name = "CursorLine" })
        end

        vim.keymap.set('n', '<CR>', '<CR><C-w>p', { buffer=true })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#EEEE00", fg = "#000000" })
    end,
})
