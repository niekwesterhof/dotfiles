return {
  'voldikss/vim-floaterm',
  config = function()
    vim.keymap.set(
      'n',
      '<leader>Tn',
      '<cmd>:FloatermNew --height=0.7 --width=0.8 --wintype=float --name=floaterm1 --position=center --autoclose=2<CR>',
      { desc = 'Open FloatTerm' }
    )
  end,
}
