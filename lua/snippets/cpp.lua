local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

return {
    s({ trig = "ndf%s+([^%s]+)", regTrig = true }, {
        f(function(_, snip)
            return "#ifndef " .. snip.captures[1]
        end, {}),
        t({"", "#define "}),
        f(function(_, snip)
            return snip.captures[1]
        end, {}),
        t({"", "", "#endif // "}),
        f(function(_, snip)
            return snip.captures[1]
        end, {}),
    }),
}
