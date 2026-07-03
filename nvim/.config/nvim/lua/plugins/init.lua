return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      luasnip.filetype_extend("html", { "javascript" })

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(), -- Ini yang memunculkan kotak preview dokumentasi/snippet
      }

      opts.mapping = cmp.mapping.preset.insert {
        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("illuminate").configure({
        providers = { "lsp", "treesitter", "regex" },
        delay = 100, -- delay highlight dalam milidetik
      })

      -- Mengatur warna highlight (contoh: memberi garis bawah / underline)
      vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true })
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true })
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "mattn/emmet-vim",
    lazy = false, 
    init = function()
      vim.g.user_emmet_install_global = 1
    
      vim.g.user_emmet_leader_key = '<C-e>'
    end,
  },

  -- indent blakline
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   ---@module "ibl"
  --   ---@type ibl.config
  --   opts = {},
  -- },

  -- mywpm
  {
    "slowy07/mywpm.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.mywpm"
    end,
  },

  -- discord rpc - cord.nvim
  {
    "vyfor/cord.nvim",
    event = "VeryLazy",
    build = ":Cord update",
    opts = function()
      return require "configs.discord"
    end,
  },

  -- hlchunk
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.chunk"
    end,
  },

  -- tiny inline diagnostic
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require "configs.inline-diagnostics"
      vim.diagnostic.config { virtual_text = false } -- Disable Neovim's default virtual text diagnostics
    end,
  },

  -- menu
  { "nvzone/volt", lazy = true },
  { "nvzone/menu", lazy = true }, -- mapping di "mappings.lua"

  -- timerly
  {
    "nvzone/timerly",
    dependencies = "nvzone/volt",
    cmd = "TimerlyToggle",
    opts = {}, -- optional
  },

  -- floaterm
  {
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = "FloatermToggle",
  },

  -- minty
  { "nvzone/volt", lazy = true },

  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  },

  -- triforce
  {
    "gisketch/triforce.nvim",
    dependencies = { "nvzone/volt" },
    config = function()
      require "configs.triforce"
    end,
  },

  -- wakatime
  { "wakatime/vim-wakatime", lazy = false },

  -- markview
  -- For `plugins.lua` users.
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    preview = {
      icon_provider = "internal",
    },

    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },
  },

  -- trouble
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  -- {
  --   'vyfor/cord.nvim',
  --   build = ':Cord update',
  --   -- opts = {}
  -- }

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "javascript", "typescript", "tsx"
  		},
  	},
  },
}
