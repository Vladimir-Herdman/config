require("luasnip.session.snippet_collection").clear_snippets "cpp"

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local rep = require("luasnip.extras").rep

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("cpp", {
    s("main", fmt([[
int main({}, {}) {{
    {}
}}
]], { i(1, "int argc"), i(2, "const char* argv[]"), i(3, "// code goes here") })),


    s("func", fmt([[
{} {}({}) {{
    {};
}}
]], { i(1, "type"), i(2, "func"), i(3, "attr"), i(4, "// code to be executed") })),


    s("class", fmt([[
class {} {{
    private:


    public:
        
}};
]], { i(1, "ClassName") })),


    s("struct", fmt([[
struct {} {{
    {};
}};
]], { i(1, "Name"), i(2, "// code goes here") })),


    s("enum", fmt([[
enum {} {{
    LOW,  // Starts at 0, can be set
    MEDIUM,
    HIGH
}};
]], { i(1, "Name") })),
})
