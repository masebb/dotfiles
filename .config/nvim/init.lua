-- lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:append("~/dotfiles/nvim")
vim.opt.rtp:prepend(lazypath)
require("plugins")
vim.opt.rtp:append("~/dotfiles/nvim")
require("others")
vim.opt.rtp:append("~/dotfiles/nvim")
require("keymap")
