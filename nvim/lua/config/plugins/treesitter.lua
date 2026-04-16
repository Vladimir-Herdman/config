return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch="main",
        build=":TSUpdate",
        opts = {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp", "python", "markdown", "markdown_inline", "sql", "html", "javascript", "tsx", "typescript", "css", "bash" },
        },
    },
}
