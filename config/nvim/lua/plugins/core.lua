return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    dependencies = {
      "LazyVim/LazyVim",
    },
    opts = {
      flavour = "mocha",
    },
  },
}
