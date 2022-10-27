local ls = require("luasnip") --{{{
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local methodSnippet = s("method", fmt([[
{} function {}({}): {}
{{
    {}
}}
]], {
        c(1, { t("public"), t("private"), t("protected")}),
        i(2, "functionName"),
        i(3, ""),
        i(4, "void"),
        i(5, "// TODO: write something"),
}))

ls.add_snippets("php", {methodSnippet})
