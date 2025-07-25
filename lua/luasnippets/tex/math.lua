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

local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  s({ trig = 'ff' }, fmta('\\frac{<>}{<>}', { d(1, get_visual), i(2) })),
  s(
    { trig = 'eq' },
    fmta(
      [[
      \begin{equation}
          <>
      \end{equation}
    ]],
      { i(1) }
    )
  ),
  s(
    { trig = 'env' },
    fmta(
      [[
      \begin{<>}
        <>
      \end{<>}
      ]],
      {
        i(1),
        i(2),
        rep(1),
      }
    )
  ),
  s('tii', fmta('\\texit{<>}', { d(1, get_visual) })),
  s(
    'fig',
    fmta(
      [[
  \begin{figure}[H]
      \centering
      \includegraphics[width=<>\linewidth]{<>}
      \caption{<>}
      \label{fig:<>}
  \end{figure}
  ]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
      }
    )
  ),
  s(
    'split',
    fmta(
      [[
    \begin{split}
        <> \\
        <>
    \end{split}
    ]],
      {
        d(1, get_visual),
        i(2),
      }
    )
  ),
  s('sum', fmta('\\sum_{<>}^{<>}', { i(1), i(2) })),
}
