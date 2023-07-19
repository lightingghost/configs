---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<D-c>"] = { "<leader>y<CR>", "command + c ==> copy", opts = { nowait = true, noremap = true, silent = true} },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>ft"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

  },
}

-- more keybinds!

return M
