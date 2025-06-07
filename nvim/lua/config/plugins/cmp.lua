return {
    {
        "hrsh7th/nvim-cmp",
        ft = _G.LAZY_LOAD_ON_FILE,
        priority = 100,
        dependencies = {
            "onsails/lspkind.nvim",
            "rafamadriz/friendly-snippets",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            {"L3MON4D3/LuaSnip", build = "make install_jsregexp"},
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp-signature-help"
        },
        config = function()
            require("config.completion")
        end,
    }
}
