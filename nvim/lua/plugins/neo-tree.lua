return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },

  config = function()
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem left <CR>')
    require('neo-tree').setup {
      cmd = 'Neotree',
      keys = {
        { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
      },
      opts = {
        filesystem = {
          window = {
            mappings = {
              ['\\'] = 'close_window',
            },
          },
        },
      },
    }
  end,
}
