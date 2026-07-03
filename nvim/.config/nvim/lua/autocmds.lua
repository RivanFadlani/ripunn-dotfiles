require "nvchad.autocmds"

vim.schedule(function()
  local luasnip = require "luasnip"
  luasnip.filetype_extend("html", { "javascript" })
  luasnip.filetype_extend("javascriptreact", { "html" })
  luasnip.filetype_extend("typescriptreact", { "html" })
end)
