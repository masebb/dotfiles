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
-- vim.notify = require("notify")
-- colorschemeの適用
vim.cmd("colorscheme tokyonight-night")
-- homeディレクトリに移動
vim.cmd("cd ~")

-- 起動時にnvim-treeを開くように
vim.api.nvim_create_autocmd("VimEnter",{
  callback = function () require"nvim-tree.api".tree.open() end

})

-- 各LSPサーバを自動で設定する(詳細は :h mason-lspconfig-automatic-server-setup)
require("mason-lspconfig").setup_handlers {
  function (server_name)
    require("lspconfig")[server_name].setup {}
  end,
  ["arduino_language_server"] = function ()
   require'lspconfig'.arduino_language_server.setup({
      cmd = {
        "arduino-language-server",
        "-cli-config", "~/.arduino15/arduino-cli.yaml",
        "-fqbn", "arduino:megaavr:nona4809",
        "-cli", "/usr/local/bin/arduino-cli",
        "-clangd", "clangd"
      }
    })
  end
}
