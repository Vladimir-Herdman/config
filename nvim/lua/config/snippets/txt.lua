require("luasnip.session.snippet_collection").clear_snippets "text"

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt
ls.add_snippets("text", {
    s("mla", fmt([[
Vladimir Herdman
Professor {}
{}
{}
{}
    Intro...
    ]], {
        i(1, "ProfName"),
        i(2, "ClassName"),
        i(3, "Date(24 November 2004)"),
        i(4, "Title"),
    })),
})

-- TODO:
-- Other writing setups seperate from mla, look into centering once pasted?
