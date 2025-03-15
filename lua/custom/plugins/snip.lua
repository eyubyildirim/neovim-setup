vim.cmd [[
" Expand snippets in insert mode with Tab
imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>'

" Jump forward in through tabstops in insert and visual mode with Control-f
imap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'
smap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'
]]

require('luasnip.loaders.from_lua').load { paths = { '~/.config/nvim/lua/luasnippets/' } }
require('luasnip').setup {
  enable_autosnippets = true,
  store_selection_keys = '<Tab>',
}

return {}
