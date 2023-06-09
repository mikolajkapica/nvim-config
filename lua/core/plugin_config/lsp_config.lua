require("mason").setup()
require("mason-lspconfig").setup({
<<<<<<< HEAD
  ensure_installed = { "lua_ls" }
=======
  ensure_installed = { "lua_ls", "java_language_server" }
>>>>>>> 9fe22d6 (add comment)
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
<<<<<<< HEAD
=======

require("lspconfig").java_language_server.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
>>>>>>> 9fe22d6 (add comment)
