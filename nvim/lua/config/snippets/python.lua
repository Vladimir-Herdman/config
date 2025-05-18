require("luasnip.session.snippet_collection").clear_snippets "python"

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("python", {
    s("def", fmt([[
def {}({}):
    {}
]], { i(1, "func"), i(2, "args"), i(3, "pass") })),


    s("class", fmt([[
class {}:
    def __init__(self, {}):
        self. = {}
]], {
        i(1, "ClassName"),
        i(2, "attr"),
        i(3, "# code here")
    })),
})
