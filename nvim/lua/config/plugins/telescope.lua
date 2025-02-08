return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        keys = {
            "<leader>tf",
            "<leader>tc",
            "<leader>tg",
            "<leader>tt"
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
                        "Library/*", "Pictures/*", "Applications/*"
                    },
                    mapping = {
                        i = {
                            ["<CR>"] = "select_default",
                        },
                    },
                },
            })

            require("telescope").load_extension("fzf")

            vim.keymap.set("n", "<leader>tf", require("telescope.builtin").find_files)
            vim.keymap.set("n", "<leader>tc", function()
                require("telescope.builtin").find_files({
                    cwd = "/Users/vova/.config/nvim",
                    hidden = false
                })
            end)
            vim.keymap.set("n", "<leader>tt", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Open current file declarations telescope" })

            require("config.telescope.multigrep").setup()
        end,
    }
}
