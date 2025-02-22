return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 20,
      open_mapping = [[<c-t>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      persist_size = false,
      direction = 'float',
      close_on_exit = true, -- close the terminal window when the process exits
      shell = nil, -- change the default shell
      float_opts = {
        border = 'rounded',
        winblend = 0,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    }
    vim.api.nvim_create_autocmd({ 'TermEnter' }, {
      pattern = { '*' },
      callback = function()
        vim.cmd 'startinsert'
      end,
    })

    local Terminal = require('toggleterm.terminal').Terminal

    local htop = Terminal:new {
      cmd = 'htop',
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd 'startinsert!'
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
      end,
      -- function to run on closing the terminal
      on_close = function(term)
        vim.cmd 'startinsert!'
      end,
    }

    local lazygit = Terminal:new {
      cmd = 'lazygit',
      dir = 'git_dir',
      direction = 'float',
      float_opts = {
        border = 'rounded',
      },
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd 'startinsert!'
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
      end,
      -- function to run on closing the terminal
      on_close = function(term)
        vim.cmd 'startinsert!'
      end,
    }

    function _lazygit_toggle()
      lazygit:toggle()
    end

    function _htop_toggle()
      htop:toggle()
    end

    -- vim.api.nvim_set_keymap('n', '<leader>Tz', '<cmd>lua _lazygit_toggle()<CR>', { desc = 'Lazygit Toggle', noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('n', '<leader>Th', '<cmd>lua _htop_toggle()<CR>', { desc = 'Htop Toggle', noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("n", "<leader>co", "<cmd>lua _bun_outdated()<CR>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('n', '<leader>cr', '<cmd>lua _cargo_run()<CR>', { noremap = true, silent = true })
  end,
}
