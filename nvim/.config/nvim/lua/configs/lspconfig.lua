require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pylsp", "clangd", "ts_ls" }
vim.lsp.enable(servers)

vim.diagnostic.config({
  virtual_text = false,
})


-- read :h vim.lsp.config for changing options of lsp servers 
