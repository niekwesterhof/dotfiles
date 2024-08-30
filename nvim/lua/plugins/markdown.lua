return {
  'MeanderingProgrammer/markdown.nvim',
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treestitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    file_types = { 'markdown', 'norg', 'rmd', 'org' },
    code = {
      sign = false,
      width = 'block',
      right_pad = 1,
    },
    heading = {
      sign = false,
      icons = {},
    },
  },
  ft = { 'markdown', 'norg', 'rmd', 'org' },
  config = function(_, opts)
    require('render-markdown').setup(opts)
    LazyVim.toggle.map('<leader>um', {
      name = 'Render Markdown',
      get = function()
        return require('render-markdown.state').enabled
      end,
      set = function(enabled)
        local m = require 'render-markdown'
        if enabled then
          m.enable()
        else
          m.disable()
        end
      end,
    })
  end,
}
