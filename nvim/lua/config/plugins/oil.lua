return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        keys = {
            "-"
        },
        config = function()
            require("oil").setup({
                default_file_explorer = true,
                view_options = {
                    show_hidden = true,
                },
                delete_to_trash = true,
                keymaps = {
                    ["q"] = "actions.close",
                },
            })

            vim.keymap.set("n", "-", "<cmd>Oil<CR>")
        end,
    }
}
