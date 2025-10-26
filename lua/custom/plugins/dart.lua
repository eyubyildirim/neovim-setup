return {
  'neovim/nvim-lspconfig',
  opts = function()
    vim.lsp.config('dartls', {
      cmd = { 'dart', 'language-server', '--protocol=lsp' },
    })
  end,
}
