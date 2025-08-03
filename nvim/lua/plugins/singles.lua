return {
  -- { 'sbdchd/neoformat' },
  -- { 'mg979/vim-visual-multi' },
  { 'debugloop/telescope-undo.nvim' },
  -- { 'tpope/vim-sleuth' },
  {
    'roodolv/markdown-toggle.nvim',
    config = function()
      require('markdown-toggle').setup { use_default_keymaps = true }
    end,
  }, -- { 'tpope/vim-fugitive' },
}
