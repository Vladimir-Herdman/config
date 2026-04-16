return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        keys = {
            "<Leader>tf", "<Leader>tc", "<Leader>tg", "<Leader>tt", "<Leader>th", "<leader>tr"
        },
        cmd = "Telescope",
        config = function()
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = {
                        "Library/*", "Pictures/*", "Applications/*",
                        ".gradle/*", "undo/*", ".vscode/*", ".DS_Store",
                        "node_modules/*", ".git/*", "%.scm", "%.png",
                        "%.webp", "%.jpeg",
                    },
                },
                pickers = {
                    find_files = {
                        cwd = vim.fn.expand("%:h"),
                        hidden = true,
                        no_ignore = true,
                    },
                    live_grep = {
                        cwd = vim.fn.expand("%:h"),
                        hidden = true,
                        glob_pattern = {
                            "!Library/", "!Applications/", "!Pictures/",
                            "!.gradle/", "!.vscode/", "!.DS_Store",
                            "!node_modules/", "!.git/",
                        },
                    },
                    planets = {show_pluto=true, show_moon=true},
                },
            })

            require("telescope").load_extension("fzf")

            local t_builtin = require("telescope.builtin")
            vim.keymap.set("n", "<Leader>tf", t_builtin.find_files)
            vim.keymap.set("n", "<Leader>tc", function() t_builtin.find_files({cwd = "/Users/vova/.config/nvim"}) end)
            vim.keymap.set("n", "<Leader>tt", t_builtin.lsp_document_symbols, { desc = "Open current file declarations telescope" })
            vim.keymap.set("n", "<Leader>th", t_builtin.help_tags, { desc = "Searc help pages"})
            vim.keymap.set("n", "<Leader>tr", t_builtin.oldfiles, { desc = "Searc oldfiles"})
            vim.keymap.set("n", "<Leader>tg", t_builtin.live_grep, { desc = "Searc oldfiles"})
        end,
    }
}
