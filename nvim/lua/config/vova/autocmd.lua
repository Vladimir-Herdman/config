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

--treesitter highlighting
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "python", "cpp", "c", "rust", "javascript", "typescript", "java", "bash", "markdown", "html", "css", },
    callback = function() vim.treesitter.start() end,
})

--Reinitialize buffer markdown syntax highlighting with treesitter, and markdown autocmds
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.defer_fn(function()
            vim.treesitter.stop()
            vim.treesitter.start()
        end, 100)
        vim.opt_local.conceallevel = 2
        vim.keymap.set("n", "gf", function()
            local line = vim.fn.getline(".")
            local spot = line:find("%[.*%]%(")
            if spot ~= nil then
                vim.fn.cursor({vim.fn.line("."), spot})
                vim.cmd("norm f(llgF")
                return
            end
            local cfile = vim.fn.expand("<cfile>")
            if cfile:find("%.pdf") ~= nil then
                local path = vim.fn.expand("%:h")
                vim.fn.jobstart({"open", path.."/"..cfile}, {detach=true})
                return
            end
            vim.cmd("norm! gf")
        end, {desc="markdown gf also works from [words](link)", buffer=true})
        vim.keymap.set("n", "gx", function()
            local line = vim.fn.getline(".")
            local spot = line:find("%[.*%]%(http")
            if spot ~= nil then
                vim.cmd(":norm mm")
                vim.fn.cursor({vim.fn.line("."), spot})
                vim.cmd(":norm f(ll")
                vim.ui.open(vim.fn.expand("<cfile>"))
                vim.cmd(":norm `m")
            end
            vim.ui.open(vim.fn.expand("<cfile>"))
        end, {desc="markdown gx works if you're on a line containing [words](link)", buffer=true})
        vim.keymap.set("n", "gt", function()
            local line = vim.fn.getline(".")
            local linkspot = line:find("%[.*%]%(http")
            local pathspot = line:find("%[.*%]%(")
            local nonob_path = line:find("%.%/.*%.md")
            if linkspot ~= nil then
                vim.cmd("norm gx")
            elseif pathspot ~= nil then
                vim.cmd("norm gf")
            elseif not vim.fn.expand("%"):find("obsidian") and nonob_path then
                vim.fn.cursor({vim.fn.line("."), nonob_path+2})
                vim.cmd("norm! gF")
            else vim.cmd("norm! <c-]>") end
        end, {desc="markdown shortcut for open file/link in []() format", buffer=true})
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"html", "grads", "javascript", "css", "typescriptreact", "R"},
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
        local vault = "/Users/vova/obsidian/notes"
        filename = filename:gsub(vault, "")
        vim.fn.system("open 'obsidian://open?file=" .. filename .. "'")
    end
end)

-- Quickfix List
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
