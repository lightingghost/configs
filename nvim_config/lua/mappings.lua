require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", "<cmd>FineCmdline<CR>", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<D-c>", "<leader>y<CR>")
map("n", "<leader>ft", "<cmd> NvimTreeToggle <CR>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
