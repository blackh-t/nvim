return {
  'aliqyan-21/darkvoid.nvim',
  lazy = false, -- load immediately
  priority = 1000, -- load before other plugins
  config = function()
    require('darkvoid').setup {
      transparent = false,
      glow = false,
      show_end_of_buffer = true,

      colors = {
        fg = '#c0c0c0',
        bg = '#1c1c1c',
        cursor = '#bdfe58',
        line_nr = '#404040',
        visual = '#303030',
        comment = '#585858',
        string = '#baffc9',
        func = '#e1e1e1',
        kw = '#f1f1f1',
        identifier = '#b1b1b1',
        type = '#66b2b2',
        --type_builtin = '#c5c5c5', -- current
        type_builtin = '#8cf8f7', -- glowy blue old
        search_highlight = '#1bfd9c',
        operator = '#1bfd9c',
        bracket = '#e6e6e6',
        preprocessor = '#4b8902',
        bool = '#66b2b2',
        constant = '#b2d8d8',

        -- enable or disable specific plugin highlights
        plugins = {
          gitsigns = false,
          nvim_cmp = true,
          treesitter = true,
          nvimtree = false,
          telescope = true,
          lualine = true,
          bufferline = false,
          oil = true,
          whichkey = true,
          nvim_notify = true,
        },

        -- gitsigns colors
        added = '#baffc9',
        changed = '#ffffba',
        removed = '#ffb3ba',

        -- Pmenu colors
        pmenu_bg = '#1c1c1c',
        pmenu_sel_bg = '#1bfd9c',
        pmenu_fg = '#c0c0c0',

        -- EndOfBuffer color
        eob = '#3c3c3c',

        -- Telescope specific colors
        border = '#585858',
        title = '#bdfe58',

        -- bufferline specific colors
        bufferline_selection = '#1bfd9c',

        -- LSP diagnostics colors
        error = '#dea6a0',
        warning = '#d6efd8',
        hint = '#bedc74',
        info = '#7fa1c3',
      },
    }

    -- This line is required to actually activate the theme
    vim.cmd.colorscheme 'darkvoid'
    -- ============================================================
    -- 1. Define the RED color for the pipe
    -- ============================================================
    vim.api.nvim_set_hl(0, 'RedPipe', { fg = '#bdfe58', bold = true })

    -- ============================================================
    -- 2. Apply the match globally
    -- We use an autocommand so it applies to every new window/file
    -- ============================================================
    vim.api.nvim_create_autocmd({ 'BufWinEnter', 'WinEnter' }, {
      pattern = '*',
      callback = function()
        -- 'matchadd' applies the 'RedPipe' highlight to the regex pattern "|"
        -- We wrap it in pcall to avoid errors if it's already set
        vim.fn.matchadd('RedPipe', [[|]])
        vim.fn.matchadd('RedPipe', [[?]])
        vim.fn.matchadd('RedPipe', '[')
        vim.fn.matchadd('RedPipe', ']')
        vim.fn.matchadd('RedPipe', '"')
      end,
    })
  end,
}
