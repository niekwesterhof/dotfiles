return {
  'zaldih/themery.nvim',
  name = 'themery',
  config = function()
    require('themery').setup {
      themes = { 'catppuccin-macchiato', 'gruvbox', 'catppuccin-mocha', 'dracula', 'rose-pine', 'tokyonight-night', 'nord' }, -- Your list of installed colorschemes.
      livePreview = true, -- Apply theme while picking. Default to true.
    }
  end,
}
