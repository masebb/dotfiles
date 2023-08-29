require("lazy").setup({
  "vim-jp/vimdoc-ja",
  "nvim-tree/nvim-web-devicons",
  "onsails/lspkind.nvim",
  "cohama/lexima.vim",
  "rcarriga/nvim-notify",
  "folke/tokyonight.nvim",
  "github/copilot.vim",
  {
  "nvim-treesitter/nvim-treesitter",
    commit = "ae88851",
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
  "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-calc",
      "hrsh7th/vim-vsnip-integ"
    },
    config = function()
      local cmp = require"cmp"
      local lspkind = require"lspkind"
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),

        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
          })
        },

        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'calc' },
        }, {
          { name = 'buffer', keyword_length = 2 },
        })
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'nvim_lsp_document_symbol' }
        }, {
          { name = 'buffer' }
        })
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline', keyword_length = 2 }
        })
      })
    end
  },
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  "hrsh7th/cmp-calc",
  "hrsh7th/vim-vsnip",
  "hrsh7th/vim-vsnip-integ",
  {
  'stevearc/aerial.nvim',
    config = function(_, opts)
      require"aerial".setup(
        {
          default_direction = "float",
          autojump = true,
          layout = {
            width = 20
          },
          filter_kind = {
            "Class",
            "Constructor",
            "Enum",
            "Function",
            "Interface",
            "Module",
            "Method",
            "Struct",
            "Variable"
          },
          highlight_on_jump = 300,
        }
      )
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
  },
  {
  'nvimdev/lspsaga.nvim',
    config = function()
      require'lspsaga'.setup({})
    end,
    dependencies = {
      "neovim/nvim-lspconfig",
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
  "mfussenegger/nvim-dap",
  {
  "rcarriga/nvim-dap-ui",
    config = true,
    dependencies = {
      "mfussenegger/nvim-dap"
    }
  },{
  "theHamsta/nvim-dap-virtual-text",
    config = true,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter"
    }
  },
  "folke/neodev.nvim",
})
