-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Ctrl+PageUp / Ctrl+PageDown: cycle buffers (needs GNOME Terminal's tab-switch shortcuts unbound)
vim.keymap.set("n", "<C-PageUp>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<C-PageDown>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })

-- Ctrl+P: find files, same as <leader><space> (like VS Code's quick open)
vim.keymap.set("n", "<C-p>", LazyVim.pick("files"), { desc = "Find Files (Root Dir)" })

-- Ctrl+W: close buffer (like closing a tab in VS Code/browser).
-- This replaces nvim's <C-w> window prefix in normal mode, so LazyVim's window mappings
-- (which were remaps of <C-w>x) are redefined below with :wincmd, which ignores mappings.
-- When there is no other buffer to show (or the buffer is unlisted, e.g. help/sidebar),
-- close the window instead; if it is the last window, quit (:quit refuses if unsaved).
local function close_buffer_or_window()
  local listed = vim.tbl_filter(function(b) return vim.bo[b].buflisted end, vim.api.nvim_list_bufs())
  if vim.bo.buflisted and #listed > 1 then
    Snacks.bufdelete()
  elseif #vim.api.nvim_tabpage_list_wins(0) > 1 then
    vim.cmd("close")
  else
    vim.cmd("quit")
  end
end
vim.keymap.set("n", "<C-w>", close_buffer_or_window, { desc = "Close Buffer (or Window if last)" })

vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
vim.keymap.set("n", "<leader>-", "<cmd>wincmd s<cr>", { desc = "Split Window Below" })
vim.keymap.set("n", "<leader>|", "<cmd>wincmd v<cr>", { desc = "Split Window Right" })
vim.keymap.set("n", "<leader>wd", "<cmd>wincmd c<cr>", { desc = "Delete Window" })
