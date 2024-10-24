return {

  config = function()
    local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
    if not vim.loop.fs_stat(lazypath) then
      local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
      vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    end ---@diagnostic disable-next-line: undefined-field
    vim.opt.rtp:prepend(lazypath)
  end,
  -- [[ Configure and install plugins ]]
  -- NOTE: Here is where you install your plugins.

  require('lazy').setup {
    ui = {
      -- If you are using a Nerd Font: set icons to an empty table which will use the
      -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
      icons = vim.g.have_nerd_font and {} or {
        cmd = '⌘',
        config = '🛠',
        event = '📅',
        ft = '📂',
        init = '⚙',
        keys = '🗝',
        plugin = '🔌',
        runtime = '💻',
        require = '🌙',
        source = '📄',
        start = '🚀',
        task = '📌',
        lazy = '💤 ',
      },
    },
    require 'config.require',
    {
      'vhyrro/luarocks.nvim',
      priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
      config = true,
      opts = {
        rocks = { 'magick' },
      },
    },
  },
}
