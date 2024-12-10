return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      local builtin = require("telescope.builtin")
      require("telescope").setup {
        pickers = {
          grep_string = {
            theme = "ivy"
          },
          help_tags = {
            theme = "ivy"
          }
        }
      }

      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>ps', function()
        builtin.find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)
      vim.keymap.set('n', '<leader>pg', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
    end
  }
}
