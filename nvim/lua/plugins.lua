require("lazy").setup({
  "vim-jp/vimdoc-ja",
  "nvim-tree/nvim-web-devicons",
  "onsails/lspkind.nvim",
  "cohama/lexima.vim",
  "rcarriga/nvim-notify",
  "folke/tokyonight.nvim",
  {
  "nvim-treesitter/nvim-treesitter",
    config = function(_, opts)
      require"nvim-treesitter.configs".setup(opts)
    end,
    opts = {
      auto_install = true,
      highlight = {
        enable = true
      }
    }
  },
  {
  'stevearc/aerial.nvim',
    opts = {
      autojump = true,
      layout = {
        width = 30
      },
    },
    config = function(_, opts)
      require"aerial".setup(opts)
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    }
  },
  {
  "williamboman/mason.nvim",
    config = true
  },
  {
  "williamboman/mason-lspconfig.nvim",
    config = true,
    dependencies = {
      "williamboman/mason.nvim"
    }
  },
  "neovim/nvim-lspconfig",
  {
  "hrsh7th/nvim-cmp",
    init = function()
      local cmp = require"cmp"
      local lspkind = require"lspkind"
      cmp.setup({
         mapping = cmp.mapping.preset.insert({
           ['<C-b>'] = cmp.mapping.scroll_docs(-4),
           ['<C-f>'] = cmp.mapping.scroll_docs(4),
           ['<C-Space>'] = cmp.mapping.complete(),
           ['<C-e>'] = cmp.mapping.abort(),
           ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
         }),
         formatting = {
           format = lspkind.cmp_format({
             mode = 'symbol',
             maxwidth = 50,
             ellipsis_char = '...',
           })
         },
         sources = cmp.config.sources({
           { name = "nvim_lsp" },
           { name = "nvim_lsp_signature_help" },
           { name = "path" },
           { name = "buffer" },
           { name = "nvim-lua" },
           { name = "cmdline" },
           { name = "git" },
           { name = "calc" }
         }),
         snippet = {
           expand = function(args)
             vim.fn['vsnip#anonymous'](args.body)
           end
         },
         cmp.setup.cmdline({ '/', '?' }, {
           mapping = cmp.mapping.preset.cmdline(),
           sources = cmp.config.sources({
             { name = 'nvim_lsp_document_symbol' }
           }, {
             { name = 'buffer' }
           })
         }),

         cmp.setup.cmdline(':', {
           mapping = cmp.mapping.preset.cmdline(),
           sources = cmp.config.sources({
             { name = 'path' }
           }, {
             { name = 'cmdline', keyword_length = 2 }
           })
         })
       })
    end
  },
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-calc",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  {
  "nvim-lualine/lualine.nvim",
    opts = {
      theme = "molokai"
    },
    config = function (_, opts)
      require("lualine").setup(opts)
    end,
    dependencies = { 
      "nvim-tree/nvim-web-devicons"
    }
  },
  {
  "nvim-tree/nvim-tree.lua",
    config = true,
    filters = {
      dotfiles = true
    },
    dependencies={
      "nvim-tree/nvim-web-devicons"
    }
  },
  {
  "akinsho/toggleterm.nvim",
    config = true
  }
})
