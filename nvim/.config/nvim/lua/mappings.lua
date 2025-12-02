require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- ===================================

-- keymap FloatermToggle (Shift + Tab)
vim.keymap.set("n", "<S-q>", ":FloatermToggle<CR>", { silent = true })

-- keymap TimerlyToggle (Shift + T)
vim.keymap.set("n", "<S-t>", ":TimerlyToggle<CR>", { silent = true })

-- keymap Triforce (Shift + f)
vim.keymap.set("n", "<S-f>", function()
  require("triforce").show_profile()
end, { desc = "Menampilkan Triforce" })

-- ===================================

-- mouse users + nvimtree users! (mapping untuk nvzone menu)
vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
  require("menu.utils").delete_old_menus()

  vim.cmd.exec '"normal! \\<RightMouse>"'

  -- clicked buf
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

  require("menu").open(options, { mouse = true })
end, {})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
