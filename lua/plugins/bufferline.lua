return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  keys = {
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
    { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
    { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete Other Buffers' },
    { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
    { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  },
  opts = {
    options = {
      mode = 'buffers',
      -- Use Snacks to close buffers to preserve window layout
      close_command = function(n)
        Snacks.bufdelete(n)
      end,
      right_mouse_command = function(n)
        Snacks.bufdelete(n)
      end,
      diagnostics = 'nvim_lsp',
      always_show_bufferline = true,
      diagnostics_indicator = function(_, _, diag)
        local icons = { Error = ' ', Warn = ' ', Info = ' ', Hint = ' ' }
        local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = 'snacks_layout_box', -- Identify snacks explorer
          text = 'Explorer',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },
  },
}
