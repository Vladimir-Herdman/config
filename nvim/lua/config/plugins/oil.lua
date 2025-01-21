return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        config = function()
            require("oil").setup({
                view_options = {
                    is_hidden_file = function(name, bufnr)
                        return name ~= ".." and vim.startswith(name, ".")
                    end,
                },
            })

            vim.keymap.set("n", "-", "<cmd>Oil<CR>")
        end,
    }
}
