-- [[config g for init.lua]]
require 'config.g'
-- [[config opt for init.lua]]
require 'config.opt'
-- [[confgi keymap for init.lua]]
require 'config.keymap'
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

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
  {
    'vhyrro/luarocks.nvim',
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
    opts = {
      rocks = { 'magick' },
    },
  },
  { 'sbdchd/neoformat' },
  { 'mg979/vim-visual-multi' },
  { 'debugloop/telescope-undo.nvim' },

  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  -- NOTE: Plugins can also be added by using a table,

  -- NOTE: Plugins can also be configured to run Lua code hen they are loaded.

  -- NOTE: Plugins can specify dependencies.
  require 'plugins.zoxide',
  require 'plugins.nerdy',
  require 'plugins.neorunner',
  require 'plugins.breadcrumbs',
  require 'plugins.which-key',
  require 'plugins.auto-complete',
  require 'plugins.obsidian',
  require 'plugins.telescope',
  require 'plugins.debug',
  require 'plugins.indent_line',
  require 'plugins.lint',
  require 'plugins.lazygit',
  require 'plugins.lsp',
  require 'plugins.autopairs',
  -- require 'plugins.neo-tree',
  require 'plugins.gitsigns',
  require 'plugins.lua-line',
  require 'plugins.catppuccin',
  require 'plugins.noice',
  require 'plugins.bufferline',
  require 'plugins.floaterm',

  require 'plugins.undotree',
  require 'plugins.treesitter',
  require 'plugins.mini',
  require 'plugins.todo-comments',
  require 'plugins.tokyo-night',
  require 'plugins.hop',
  -- require 'plugins.auto-format',
  require 'plugins.comment',
  require 'plugins.conform',
  -- require 'plugins.oil',
  require 'plugins.alpha-nvim',
  require 'plugins.rose-pine',
  require 'plugins.rainbow-parentheses',
  require 'plugins.dracula',
  require 'plugins.nord',
  require 'plugins.begood',
  require 'plugins.gruvbox',
  require 'plugins.image',
  require 'plugins.dracula',
  require 'plugins.themery',
  require 'plugins.cheatsheet',
  require 'plugins.yazi',
  -- require 'plugins.markdown',
  require 'plugins.render-markdown',
  require 'plugins.dadbod',
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
