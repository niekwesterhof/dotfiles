return {
  'voldikss/vim-floaterm',
  config = function()
    vim.keymap.set(
      'n',
      '<leader>fn',
      '<cmd>:FloatermNew --height=0.7 --width=0.8 --wintype=float --name=floaterm1 --position=center --autoclose=2<CR>',
      { desc = 'Open FloatTerm' }
    )
    vim.keymap.set('n', '<leader>ft', '<cmd>:FloatermToggle<CR>', { desc = 'Toggle FloatTerm' })
    vim.keymap.set('n', '<leader>rc', '<cmd>:w<CR> :FloatermToggle<CR> g++ -Wall ' .. vim.fn.expand('%') .. ' && ./a.out<CR>', { desc = 'Build and Run C++ file' })
    -- vim.keymap.set('t', '<leader>flt', '<cmd>:FloatermToggle<CR>', { desc = 'Toggle FloatTerm' })
  end,
}
