require("hlchunk").setup {
  chunk = {
    enable = true,
    use_treesitter = true,
    chars = {
      horizontal_line = "─",
      vertical_line = "│",
      left_top = "╭",
      left_bottom = "╰",
      right_arrow = ">",
    },
    style = "#806d9c",
  },
  line_num = {
    enable = true,
    -- use_treesitter = false,
    style = "#806d9c",
  },
}
