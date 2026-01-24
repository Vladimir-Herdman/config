return {
    {
        'echasnovski/mini.diff',
        version = '*',
        config = function()
            require("mini.diff").setup({
                mappings = {
                    -- Go to hunk range in corresponding direction
                    goto_prev = '<Leader>gN', --setup here for next hunk
                    goto_next = '<Leader>gn', --setupu here for previous hunk
                },

                options = {
                    wrap_goto = true,
                }
            })

            --vim.api.nvim_create_autocmd("BufWinEnter", {
                --desc = "autocommand to set local sign column if in tracked fil",
                --callback = function(args)
                    --local git_repo = vim.fn.finddir(".git", ".;")
                    --if (git_repo ~= "") then
                        --vim.opt_local.signcolumn = "yes:2"
                        --Original is blue: 
                        --vim.api.nvim_set_hl(0, 'MiniDiffSignChange', { fg = '#d1d07b' })
                    --end
                --end
            --})
        end
    }
}
