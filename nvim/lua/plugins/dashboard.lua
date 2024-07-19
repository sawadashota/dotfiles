return {
  'nvimdev/dashboard-nvim',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },
  config = function()
    require('dashboard').setup({
      theme = 'hyper',
      config = {
        week_header = {
         enable = true,
        },
        shortcut = {
          { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = ' Live Grep',
            group = 'DiagnosticHint',
            action = 'Telescope live_grep',
            key = 'g',
          },
          {
            desc = ' ghq',
            group = 'Number',
            action = 'Telescope ghq',
            key = 'r',
          },
        },
      },
    })
  end,
}
