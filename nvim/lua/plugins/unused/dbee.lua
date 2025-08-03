return {
  'kndndrj/nvim-dbee',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require('dbee').install()
  end,
  config = function()
    require('dbee').setup {
      sources = {
        require('dbee.sources').MemorySource:new {
          {
            name = 'Batteries',
            id = 'Batt',
            type = 'mysql',
            url = 'admin:Pioneer!0811@192.168.000.100:3306/batteries',
          },
          -- ...
        },
        require('dbee.sources').EnvSource:new 'DBEE_CONNECTIONS',
        require('dbee.sources').FileSource:new(vim.fn.stdpath 'cache' .. '/dbee/persistence.json'),
      },
      -- ...
    }
  end,
}
