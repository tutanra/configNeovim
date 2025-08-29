return {
  "folke/snacks.nvim",
  opts = {
    dashboard = { enabled = true },
    indent = {
      indent = { enabled = false },
      chunk = {
        enabled = true,
        char = { horizontal = "─", vertical = "│", corner_top = "╭", corner_bottom = "╰", arrow = "─" },
      },
    },
    picker = { sources = {
      explorer = { layout = { layout = { width = 32 } } },
    }
 },
  },
}
