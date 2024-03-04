-- https://www.lazyvim.org/plugins/colorscheme#tokyonight

return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "storm",
      transparent = true,
      terminal_colors = true,
      sidebars = { "qf", "help" },
      lualine_bold = false,
    },
  },
}
