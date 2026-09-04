return {
  'rust-lang/rust.vim',
  ft = 'rust',
  init = function()
    vim.g.rustfmt_autosave = vim.g.autoformat_on_save and 1 or 0
  end,
}
