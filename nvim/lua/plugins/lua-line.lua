return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      options = {
        -- theme = vim.g.colors_name,
        theme = 'auto',
      },
    }
  end,
}
