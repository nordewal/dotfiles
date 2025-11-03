-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map("n", "<leader>r", "<cmd>Neotree focus<cr>")
map("n", "<C-F4>", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("i", "<C-k>", function()
  return vim.lsp.buf.hover()
end, { desc = "Hover" })
