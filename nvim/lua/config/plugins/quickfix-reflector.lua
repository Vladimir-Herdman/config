-- Exists so quickfix lists are modifiable and save modifications for :cdo and :cfdo
return {
    {
        "stefandtw/quickfix-reflector.vim",
        config = function()
            vim.g.qf_modifiable = 1
        end,
    }
}
