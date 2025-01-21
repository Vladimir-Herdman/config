return {
    {
        "sainnhe/everforest",
        config = function()
            local alacritty = vim.fn.getenv("ALACRITTY_WINDOW_ID")
            if (alacritty ~= vim.NIL and alacritty ~= "") then
                print("alacritty")
                vim.cmd([[
                let g:everforest_enable_italic = 1
                let g:everforest_transparent_background = 1
                set termguicolors
                colorscheme everforest
                ]])
            end
        end,
    }
}
