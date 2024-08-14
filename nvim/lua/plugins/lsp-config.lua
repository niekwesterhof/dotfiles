return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()

      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      }
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls', 'tsserver' },
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require 'lspconfig'
      lspconfig.lua_ls.setup {}
      lspconfig.tsserver.setup {}
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          vim.keymap.set('n', 'crr', vim.lsp.buf.rename, { buffer = args.buf })
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { buffer = args.buf })
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = args.buf })
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        end,
      })
      vim.api.nvim_create_autocmd('LspDetach', {
        callback = function(args)
          vim.keymap.del('n', 'crr', { buffer = args.buf })
          vim.keymap.set({ 'n', 'v' }, '<space>ca', { buffer = args.buf })
          vim.keymap.set('n', 'gr', { buffer = args.buf })
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        end,
      })
      automatic_installation = true
      ui = {
        icons = {
          server_installed = '✓',
          server_pending = '➜',
          server_uninstalled = '✗',
        },
      }
    end,
  },
}
