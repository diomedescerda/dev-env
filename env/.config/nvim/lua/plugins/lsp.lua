return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "j-hui/fidget.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local lsp_flags = {
        allow_incremental_sync = true,
        debounce_text_changes = 150,
      }
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities())

      require("fidget").setup({})
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensured_installed = { "lua_ls", "clangd" },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup {
              capabilities = capabilities
            }
          end,
          ["cssls"] = function()
            lspconfig.cssls.setup {
              capabilities = capabilities,
              flags = lsp_flags
            }
          end,
          ["html"] = function()
            lspconfig.html.setup {
              capabilities = capabilities,
            }
          end
        }
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end

          local builtin = require "telescope.builtin"

          vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
          vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
          vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

          vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = 0 })
          vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })
          vim.keymap.set("n", "<space>wd", builtin.lsp_document_symbols, { buffer = 0 })


          vim.keymap.set("", "<leader>l", function()
            local config = vim.diagnostic.config() or {}
            if config.virtual_text then
              vim.diagnostic.config { virtual_text = false, virtual_lines = true }
            else
              vim.diagnostic.config { virtual_text = true, virtual_lines = false }
            end
          end, { desc = "Toggle lsp_lines" })
        end
      })
    end,
  }
}
