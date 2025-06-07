return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = true,

    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    opts = {
        workspaces = {
            {
                name = "Notes",
                path = "~/Notes/",
            },
        },
    },

    completion = {
        nvim_cmp = true,
        blink = false,
        min_chars = 2,
    },

    mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = {
            action = function()
                return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
        },
    },

    new_notes_location = "current_dir",
    disable_frontmatter = true,

    picker = {
        name = "telescope.nvim",
    },
}
