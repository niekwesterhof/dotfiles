return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha',
      background = {

        light = 'latte',
        dark = 'mocha',
      },
      color_overrides = {
        mocha = {
          rosewater = '#f5e0dc',
          flamingo = '#f2cdcd',
          pink = '#f5c2e7',
          mauve = '#cba6f7',
          red = '#f38ba8',
          maroon = '#eba0ac',
          peach = '#fab387',
          yellow = '#f9e2af',
          green = '#a6e3a1',
          teal = '#94e2d5',
          sky = '#89dceb',
          sapphire = '#74c7ec',
          blue = '#89b4fa',
          lavender = '#b4befe',
          text = '#cdd6f4',
          subtext1 = '#bac2de',
          subtext0 = '#a6adc8',
          overlay2 = '#9399b2',
          overlay1 = '#7f849c',
          overlay0 = '#6c7086',
          surface2 = '#585b70',
          surface1 = '#45475a',
          surface0 = '#313244',
          base = '#1e1e2e',
          mantle = '#181825',
          crust = '#11111b',
        },
        macchiato = {
          rosewater = '#f5e0dc',
          flamingo = '#f2cdcd',
          pink = '#f5c2e7',
          mauve = '#cba6f7',
          red = '#f38ba8',
          maroon = '#eba0ac',
          peach = '#fab387',
          yellow = '#f9e2af',
          green = '#a6e3a1',
          teal = '#94e2d5',
          sky = '#89dceb',
          sapphire = '#74c7ec',
          -- blue = '#89b4fa',
          blue = '#83A598',
          lavender = '#b4befe',
          text = '#cdd6f4',
          subtext1 = '#d5c4a1',
          subtext0 = '#bdae93',
          overlay2 = '#9399b2',
          overlay1 = '#7f849c',
          overlay0 = '#6c7086',
          surface2 = '#585b70',
          surface1 = '#45475a',
          surface0 = '#313244',
          base = '#252526',
          mantle = '#3E3E40',
          crust = '#323232',
        },
      },
      integrations = {
        neotree = true,
        noice = true,
        treesitter = true,
        mason = true,
        telescope = {
          enabled = true,
        },
      },
    }
  end,
}
