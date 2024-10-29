return {
  'nvim-lualine/lualine.nvim',

  config = function()
    require('lualine').setup {
      options = {
        theme = 'auto',
      },
      sections = {
        lualine_x = {
          {
            require('noice').api.statusline.mode.get,
            cond = require('noice').api.statusline.mode.has,
            color = { fg = '#ff9e64' },
          },
        },
      },
    }
  end,
}
