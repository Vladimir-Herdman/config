return {
    {
        "mason-org/mason.nvim",
        ft = _G.LAZY_LOAD_ON_FILE,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        ft = _G.LAZY_LOAD_ON_FILE,
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                automatic_enable = true
            })

            local lspcon = require("lspconfig")
            lspcon.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        }
                    }
                }
            })
        end,
    }
}
