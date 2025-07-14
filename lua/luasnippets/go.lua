-- Abbreviations used in this article and the LuaSnip docs
local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

return {
  s(
    'main',
    fmta(
      [[
      func main() {
        <>
      }
 ]],
      {
        i(1),
      }
    )
  ),
  s(
    'meth',
    fmta(
      [[
    func (<> *<>) <>(<>) <> {
      <>
    }
  ]],
      {
        i(1, 'self'),
        i(2, 'Type'),
        i(3, 'MethodName'),
        i(4, 'args'),
        i(5, 'returns'),
        i(6),
      }
    )
  ),
}
