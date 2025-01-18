return {
  {
    'nvim-lualine/lualine.nvim',
    enabled = false,
    dependencies = { 'kyazdani42/nvim-web-devicons' },  -- Optional, for icons
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',  -- Automatically adapts to your colorscheme
          section_separators = { left = '', right = '' },  -- Rounded separators
          component_separators = { left = '', right = '' },  -- Small rounded separators
          icons_enabled = true,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_z = {'location'}
        },
      }
    end
  }
}

