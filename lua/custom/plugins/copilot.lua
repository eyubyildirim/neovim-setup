-- ~/.config/nvim/lua/custom/plugins/copilot.lua
return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter', -- Or "VeryLazy" or "BufEnter" if you prefer
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = '<C-k>', -- Tip: Chose a less common binding for accept
          accept_word = false,
          accept_line = false,
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
      },
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_prev = '[[',
          jump_next = ']]',
          accept = '<CR>',
          refresh = 'gr',
          open = '<M-CR>', -- Open the panel
        },
        layout = {
          position = 'bottom', -- | top | left | right
          ratio = 0.4,
        },
      },
      filetypes = {
        yaml = true,
        markdown = true,
        help = false,
        gitcommit = true,
        gitrebase = true,
        hgcommit = true,
        svn = true,
        cvs = true,
        ['.'] = true, -- Fallback for unknown filetypes
        lua = true, -- Ensure lua is enabled
        python = true,
        javascript = true,
        typescript = true,
        -- Add or remove filetypes as needed
        -- Example to disable for specific filetypes:
        -- C = false,
      },
      copilot_node_command = nil, -- See plugin docs for more info
      server_opts_override = {},
    },
    config = function(_, opts)
      require('copilot').setup(opts)
      -- Optional: Hide the virtual text when a completion is active
      vim.api.nvim_create_augroup('CopilotAutoHideVirtualText', { clear = true })
    end,
  },

  -- Optional: For GitHub Copilot Chat
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary', -- Or "stable" or the latest release tag
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- Ensure Copilot itself is loaded
      { 'nvim-lua/plenary.nvim' }, -- Required for telescope integration
    },
    opts = {
      debug = false, -- Enable debugging
      -- See Configuration section for rest
      -- https://github.com/CopilotC-Nvim/CopilotChat.nvim#configuration
      -- Example custom actions:
      -- actions = {
      --   MoreHuman = {
      --     prompt = "Make this text more human and conversational.",
      --     type = "replace", -- can be "replace", "append", "new"
      --   }
      -- }
    },
    config = function(_, opts) end,
    -- You can lazy-load CopilotChat similarly to Copilot if you wish
    -- event = "VeryLazy",
    -- cmd = {"CopilotChat", "CopilotChatExplain", "CopilotChatTests", ...},
  },
}
