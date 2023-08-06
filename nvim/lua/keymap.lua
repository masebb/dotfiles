-- 表示行でカーソル移動
vim.keymap.set({'n','v'}, 'j', 'gj')
vim.keymap.set({'n','v'}, 'k', 'gk')

-- <space>eでnvim-treeをトグル
local api = require "nvim-tree.api"
vim.keymap.set("n", "<space>e", function() api.tree.toggle() end)

-- terminalモード離脱をescに、esc*2でターミナルでesc
vim.keymap.set("t", "<ESC>", "<c-\\><c-n><Plug>(esc)")
vim.keymap.set("n", "<Plug>(esc)<ESC>", "i<ESC>")

-- lazygitを<space>gで起動
local lg = require("toggleterm.terminal").Terminal:new{
  cmd = "lazygit",
  direction = "float",
  hidden = true
}
vim.keymap.set("n", "<space>g", function() lg:toggle() end )

-- ターミナルを<space>tで起動
local terminal = require("toggleterm.terminal").Terminal:new{
  direction = "horizontal"
}
vim.keymap.set("n", "<space>t", function() terminal:toggle() end )

-- aerial(コードアウトラインを表示する)を<space>aで起動
vim.keymap.set('n', '<space>a', '<cmd>AerialToggle!<CR>')
