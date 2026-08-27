-- Markdown reading + preview.
--
-- Two complementary tools:
--   render-markdown.nvim  in-buffer rendering (headings, tables, code blocks, checkboxes)
--   peek.nvim             live browser preview, already configured in init.lua
return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ft = { 'markdown', 'codecompanion' },
    opts = {
      -- 'rendered' hides the raw syntax in normal mode; the line under the cursor
      -- reverts to raw so you can still edit it.
      render_modes = { 'n', 'c', 't' },
      anti_conceal = { enabled = true },
      heading = {
        sign = false,
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
        width = 'block',
        left_pad = 0,
        right_pad = 2,
      },
      code = {
        sign = false,
        width = 'block',
        right_pad = 2,
        language_pad = 1,
      },
      bullet = { icons = { '•', '◦', '▸', '▹' } },
      checkbox = {
        unchecked = { icon = '󰄱 ' },
        checked = { icon = '󰱒 ' },
      },
      pipe_table = { preset = 'round' },
      link = { hyperlink = '󰌷 ' },
    },
    keys = {
      { '<leader>mr', '<cmd>RenderMarkdown toggle<cr>', desc = '[M]arkdown [R]ender toggle', ft = 'markdown' },
    },
  },

  -- Keymaps for peek.nvim (the plugin itself is declared in init.lua).
  {
    'toppair/peek.nvim',
    keys = {
      {
        '<leader>mp',
        function()
          local peek = require 'peek'
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = '[M]arkdown [P]review toggle (browser)',
        ft = 'markdown',
      },
    },
  },
}
