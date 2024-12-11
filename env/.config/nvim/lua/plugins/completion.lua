return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      vim.opt.completeopt = { "menu", "menuone", "preview", "noselect" }

      local lspkind = require "lspkind"
      local cmp = require "cmp"

      cmp.setup {
        sources = {
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
        },

        mapping = {
          ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-l>"] = cmp.mapping(
            cmp.mapping.confirm {
              behavior = cmp.SelectBehavior.Insert,
              select = true,
              select
            },
            { "i", "c" }
          ),
        },

        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end
        },

        window = {
          documentation = cmp.config.window.bordered(),
        },

        formatting = {
          fields = { "abbr", "kind", "menu" },
          expandable_indicator = true,
          format = function(entry, vim_item)
            vim_item.kind = string.format("%s %s", lspkind.presets.default[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
              nvim_lsp = "語",
              nvim_lua = "爆",
              treesitter = "木",
              path = "道",
              buffer = "憶",
              zsh = "端",
              vsnip = "雷",
              spell = "暈",
            })[entry.source.name]

            return vim_item
          end,
        }
      }
    end,
  },
}
