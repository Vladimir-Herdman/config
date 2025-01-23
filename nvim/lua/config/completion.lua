vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Look to :h completeopt for options
vim.opt.shortmess:append("c")

local lspkind = require("lspkind")
lspkind.init({})

local cmp = require("cmp")

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
        { name = "nvim_lsp_signature_help" },
    },
    mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-y>"] = cmp.mapping(
            cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            }),
            { "i", "c" }
        ),
    },

    -- Enable luasnip ot handle snipper expansion for nvim-cmp
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
})

local ls = require("luasnip")
ls.config.set_config({
    history = false,
    updateevents = "TextChanged, TextChangedI",
})

-- This line here goes to my config.snippets folder and grabs every lua there and loads it up
-- Essentialluy, it loads my personal snippets
for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/config/snippets/*.lua", true)) do
    loadfile(ft_path)()
end

vim.keymap.set({ "i", "s" }, "<c-k>", function()  -- ctrl k to expand if there's something to expand
    if (ls.expand_or_jumpable()) then                     -- and ctrl k to continue forward to nodes in expansion
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if (ls.jumpable(-1)) then
        ls.jump(-1)
    end
end, { silent = true })
