return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        svelte = { 'prettierd' },
        astro = { 'prettierd' },
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        json = { 'prettierd' },
        graphql = { 'prettierd' },
        java = { 'google-java-format' },
        kotlin = { 'ktlint' },
        ruby = { 'standardrb' },
        markdown = { 'prettierd' },
        erb = { 'htmlbeautifier' },
        html = { 'htmlbeautifier' },
        bash = { 'beautysh' },
        proto = { 'buf' },
        rust = { 'rustfmt' },
        yaml = { 'prettier' },
        toml = { 'taplo' },
        css = { 'prettierd' },
        scss = { 'prettierd' },
        sh = { 'beautysh' },
        zsh = { 'beautysh' },
        go = { 'gofmt' },
        python = { 'pylint' },
        cpp = { 'clang-format' },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>Ff', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}
