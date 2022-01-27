local null_ls = require 'null-ls'

null_ls.setup {
  diagnostics_format = '[#{c}] #{m} (#{s})',
  sources = {
    null_ls.builtins.completion.spell,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.code_actions.gitsigns,
    -- null_ls.builtins.formatting.codespell,
    -- null_ls.builtins.diagnostics.codespell,
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd [[augroup Format]]
      vim.cmd [[autocmd! * <buffer>]]
      vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
      vim.cmd [[augroup END]]
    elseif client.resolved_capabilities.document_range_formatting then
      vim.cmd [[augroup Format]]
      vim.cmd [[autocmd! * <buffer>]]
      vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.range_formatting()]]
      vim.cmd [[augroup END]]
    end
  end,
}
