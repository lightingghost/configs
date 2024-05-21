vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- neovide
if vim.g.neovide then
  vim.o.guifont = "IosevkaTerm Nerd Font:h14"
  vim.g.neovide_input_use_logo = 1
  vim.keymap.set('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
  vim.keymap.set('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
  vim.keymap.set('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
  vim.keymap.set('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})
  vim.keymap.set('v', '<D-c>', '+y<CR>', { noremap = true, silent = true})
end
