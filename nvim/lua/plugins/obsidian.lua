return {
  'epwalsh/obsidian.nvim',
  lazy = false,
  -- ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  -- refer to `:h file-pattern` for more examples
  -- 'BufReadPre /home/niek/Documents/Vault/*.md',
  -- 'BufNewFile /home/niek/Documents/Vault/*.md',
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
  },

  opts = {
    ensured_installed = { 'markdownlint' },
    workspaces = {
      {
        name = 'Vault',
        path = '~/Documents/Vault/',
      },
    },
    completion = {
      nvim_cmp = true,
      min_char = 2,
    },
    templates = {
      folder = '~/Documents/Vault/99 - Meta/00 - Templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M:%S',
    },
    ui = {
      enable = true,
    },
  },
}
