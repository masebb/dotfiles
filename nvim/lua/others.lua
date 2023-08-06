local options = {
  number = true,
  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,
  clipboard = "unnamedplus",
  wrap = false
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
-- notifyをカスタム
vim.notify = require("notify")
-- colorschemeの適用
vim.cmd("colorscheme tokyonight-night")
-- homeディレクトリに移動
vim.cmd("cd ~")

local opentree = function ()require"nvim-tree.api".tree.open() end
vim.api.nvim_create_autocmd("VimEnter",{
  callback =  opentree
})
--vim.api.nvim_create_autocmd("VimEnter", {}

-- 各LSPサーバを自動で設定する(詳細は :h mason-lspconfig-automatic-server-setup)
require("mason-lspconfig").setup_handlers {
  function (server_name)
    require("lspconfig")[server_name].setup {}
  end
}
