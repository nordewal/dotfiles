return {
  {
    "ibhagwan/fzf-lua",
    -- opts will be merged with the parent spec
    opts = function(_, opts)
      opts = {
        files = {
          hidden = false,
        },
        grep = {
          hidden = true,
        },
      }
    end,
  },
}
