return {
  'zenbones-theme/zenbones.nvim',
  dependencies = 'rktjmp/lush.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    -- Enable true colors and dark background
    vim.opt.termguicolors = true
    vim.opt.background = 'dark'

    -- Zenwritten-specific readability tweaks
    vim.g.zenwritten_darken_comments = 50
    vim.g.zenwritten_italic_comments = true
    vim.g.zenwritten_italic_strings = true
    vim.g.zenwritten_darken_cursor_line = 40
    vim.g.zenwritten_darken_non_text = 100
    vim.g.zenwritten_transparent_background = true

    -- Load the colorscheme
    vim.cmd.colorscheme 'zenwritten'

    -- Your existing customizations
    vim.api.nvim_set_hl(0, 'Keyword', { fg = '#866e40', bold = true })
    vim.api.nvim_set_hl(0, 'Function', { fg = '#DEDCDC', bold = true })
    vim.api.nvim_set_hl(0, 'Type', { fg = '#DEDCDC' })
    vim.api.nvim_set_hl(0, 'Identifier', { fg = '#9E9E9E' })
    vim.api.nvim_set_hl(0, 'String', { fg = '#8899b8' })
    vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#3a3a3a' })
    vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = '#3a3a3a' })
    vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = '#3a3a3a' })

    -- ============================================================
    -- 1. Define the RED color for the pipe
    -- ============================================================
    vim.api.nvim_set_hl(0, 'RedPipe', { fg = '#BD9955', bold = true })
    vim.api.nvim_set_hl(0, 'red', { fg = '#d2ad65', bold = true })
    vim.api.nvim_set_hl(0, 'red2', { fg = '#866e40', bold = true })

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
        vim.fn.matchadd('red2', [[fn]])
      end,
    })
  end,
}
