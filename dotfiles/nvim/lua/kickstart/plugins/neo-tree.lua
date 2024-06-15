-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left <CR>', {})
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    end
}
