return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'jayp0521/mason-null-ls.nvim',
  },
  config = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    -- setup mason-null-ls
    require('mason-null-ls').setup {
      ensure_installed = {
        'prettier',
        'stylua',
        'eslint_d',
        'shfmt',
        'checkmake',
        'ruff', -- Ruff handles both linting and fast formatting
      },
      automatic_installation = true,
    }

    local sources = {
      diagnostics.checkmake,
      formatting.prettier.with { filetypes = { 'html', 'json', 'yaml', 'markdown' } },
      formatting.stylua,
      formatting.shfmt.with { args = { '-i', '4' } },
      formatting.terraform_fmt,

      -- Ruff Import Sorting
      require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },

      -- Ruff Code Formatting with Max Line Length
      require('none-ls.formatting.ruff_format').with {
        extra_args = { '--line-length', '80' }, -- Change "88" to your preferred width
      },

      formatting.clang_format,
    }

    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    null_ls.setup {
      sources = sources,
      on_attach = function(client, bufnr)
        if client:supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              if not vim.g.autoformat_on_save then
                return
              end
              vim.lsp.buf.format {
                bufnr = bufnr,
                filter = function(c)
                  -- Only allow null-ls to format to prevent conflicts
                  return c.name == 'null-ls'
                end,
                async = false,
              }
            end,
          })
        end
      end,
    }
  end,
}
