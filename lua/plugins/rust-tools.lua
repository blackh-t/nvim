return {
  'rust-lang/rust-tools.nvim',
  dependencies = { 'neovim/nvim-lspconfig' },
  opts = {
    tools = {
      auto_insert_foreign_modules = true,
      runnables = {
        show_workspace_rustc_command = true,
      },
      inlay_hints = {
        highlight = 'LspInlayHint',
        show_parameter_hints = true,
        show_variable_declarations = false,
        auto_set_hints = true,
      },
    },
    server = {
      on_attach = function(_, bufnr)
        vim.keymap.set('n', '<leader>rr', require('rust-tools.runnables').runnables, { buffer = bufnr, desc = 'Cargo run' })
        vim.keymap.set('n', '<leader>rt', require('rust-tools.test')->show_test_signs, { buffer = bufnr, desc = 'Test signs' })
        vim.keymap.set('n', '<leader>rT', require('rust-tools.test')->run_all_tests, { buffer = bufnr, desc = 'Run all tests' })
        vim.keymap.set('n', '<leader>rm', require('rust-tools.expand_macro').expand_macro, { buffer = bufnr, desc = 'Expand macro' })
        vim.keymap.set('n', '<leader>rc', require('rust-tools.crate_graph').crate_graph, { buffer = bufnr, desc = 'Crate graph' })
      end,
    },
  },
}