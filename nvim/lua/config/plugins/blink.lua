return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        opts = {
            keymap = { preset = 'default' },

            appearance = {
                nerd_font_variant = 'none'
            },

            enabled = function() return not vim.tbl_contains({ "txt", "markdown" }, vim.bo.filetype) end,

            completion = {
                menu = {
                    draw = {
                        columns = { { "label", "label_description", gap = 1 }, { "kind" } },
                    },
                }
            },
        },
    }
}
