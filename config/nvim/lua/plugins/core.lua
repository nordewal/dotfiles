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
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          any = {
            { find = "Failed to run `config` for nvim%-dap" },
            { find = "Mason package path not found for %*%*debugpy%*%*" },
          },
        },
        opts = { skip = true },
      })
    end,
  },
}
