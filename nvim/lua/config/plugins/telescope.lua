return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        },
        keys = {
            "<leader>tf",
            "<leader>tc"
        },
        config = function()
            require("telescope").setup({
                pickers = {
                    find_files = {
                        theme = "ivy"
                    }
                },
                extensions = {
                    fd = {}
                },
                defaults = {
                    file_ignore_patterns = {
                        "Library/*", "Pictures/*", "Applications/*"
                    },
                    find_command = {
                        "fd . '.\' -E Library -E Applications -E Pictures"
                    },
                }
            })

            vim.keymap.set("n", "<leader>tf", require("telescope.builtin").find_files)
            vim.keymap.set("n", "<leader>tc", function()
                require("telescope.builtin").find_files({
                    cwd = "/Users/vova/.config/nvim",
                    hidden = false
                })
            end)
        end,
    }
}
