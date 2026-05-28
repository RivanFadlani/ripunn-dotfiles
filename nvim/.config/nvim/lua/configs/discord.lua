local options = {
  user_code = false,
  auto_connect = true,

  idle = {
    enable = true,
    timeout = 180000,
    show_status = true,
    ignore_focus = true,
    details = "Idling",
    state = "Away from keyboard",
    icon = "https://raw.githubusercontent.com/vyfor/icons/master/icons/default/accent/idle.png",
  },

  display = {
    theme = "default",
    flavor = "accent",
    view = "full",
    show_time = true,
    show_repository = true,
    show_cursor_position = false,
    swap_fields = false,
    swap_icons = false,
  },

  lsp = {
    show_problem_count = false,
  },
}

return options
