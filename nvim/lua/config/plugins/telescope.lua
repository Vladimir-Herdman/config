return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        },
        keys = {
            "<leader>tf",
            "<leader>tc",
            "<leader>tg"
        },
        config = function()
            require("telescope").setup({
                pickers = {
                    find_files = {
                        theme = "ivy"
                    }
                },
                extensions = {
                    fzf = {}
                },
                defaults = {
                    file_ignore_patterns = {
                        "Library/*", "Pictures/*", "Applications/*"
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

            require("config.telescope.multigrep").setup()
        end,
    }
}
