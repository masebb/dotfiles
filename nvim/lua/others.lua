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

-- nvim-dapのアイコン設定
vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

  -- 円
vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
  -- 三点リーダー
vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
  -- !マーク
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
  -- インフォマーク
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
  -- 再生マーク
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

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

-- nvim-dapの設定
local dap = require('dap')
-- nvim-dap DAPアダプターの設定
dap.adapters = {
  codelldb = {
    type = 'server',
    port = '${port}',
    executable = {
      command = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb',
      args = {'--port', '${port}'}
    }
  },
  delve = {
    type = 'server',
    port = '${port}',
    executable = {
      command = vim.fn.stdpath('data') .. '/mason/packages/delve/dlv',
      args = {'dap', '-l', '127.0.0.1:${port}'},
    }
  }
}
-- C++の設定
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
-- Cの設定
dap.configurations.c = dap.configurations.cpp
-- Rustの設定
dap.configurations.rust = dap.configurations.cpp

