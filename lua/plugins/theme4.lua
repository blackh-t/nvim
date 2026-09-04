return {
  {
    'projekt0n/github-nvim-theme',
    lazy = false, -- Make sure it loads on startup so the colorscheme applies immediately
    priority = 1000, -- Load this before other plugins
    config = function()
      require('github-theme').setup {
        -- Your custom options go here
        options = {
          transparent = true,
          styles = {
            comments = 'italic',
          },
        },

        groups = {
          all = {
            PreProc = { fg = '#8b949e', italic = false },
          },
        },
      }

      vim.cmd 'colorscheme github_dark'
    end,
  },
}
