return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        keys = {
            "<Leader>tf", "<Leader>tc", "<Leader>tg", "<Leader>tt", "<Leader>th"
        },
        config = function()
            require("telescope").setup({
                pickers = {
                    find_files = {
                        theme = "ivy",
                        mappings = {
                            i = {
                                ["<CR>"] = "select_default",
                            },
                        },
                    },
                },
                extensions = {
                    fzf = {}
                },
                defaults = {
                    file_ignore_patterns = {
                        "Library/*",
                        "Pictures/*",
                        "Applications/*",
                        ".gradle/*",
                        ".vscode/*",
                        ".DS_Store",
                        "node_modules/*",
                        ".git/*",
                        "%.scm",
                        "%.png", "%.webp", "%.jpeg"
                    },
                    mapping = {
                        i = {
                            ["<CR>"] = "select_default",
                        },
                    },
                },
            })

            require("telescope").load_extension("fzf")

            local t_builtin = require("telescope.builtin")
            vim.keymap.set("n", "<Leader>tf", function()
                t_builtin.find_files({
                    cwd = vim.fn.expand("%:p:h"),
                    hidden = true,
                    no_ignore = true,
                })
            end)
            vim.keymap.set("n", "<Leader>tc", function()
                t_builtin.find_files({
                    cwd = "/Users/vova/.config/nvim",
                    hidden = false
                })
            end)
            vim.keymap.set("n", "<Leader>tt", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Open current file declarations telescope" })
            vim.keymap.set("n", "<Leader>th", t_builtin.help_tags, { desc = "Searc help pages"})

            require("config.telescope.multigrep").setup()
        end,
    }
}
