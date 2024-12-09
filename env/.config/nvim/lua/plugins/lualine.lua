return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local devicons = require('nvim-web-devicons')
    local function mode()
      local mode_code = vim.api.nvim_get_mode().mode
      local mode_map = { ['n'] = 'N', ['i'] = 'I', ['v'] = 'V', ['V'] = 'V', [''] = 'V', ['c'] = 'C', ['t'] = 'T', ['R'] = 'R', }
      return mode_map[mode_code] or mode_code:sub(1,1):upper()
    end
    require('lualine').setup({
      options = {
        theme = 'dracula',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' }
      },
      sections = {
        lualine_a = {mode},
        lualine_x = {
          {
            function()
              local ff = vim.bo.fileformat
              local symbols = {
                unix = ' ',
                dos = '󰍲 ',
                mac = ' ',
              }
              local encoding = vim.bo.fileencoding
              local filetype = vim.bo.filetype
              local icon, _ = devicons.get_icon_by_filetype(filetype)
              local parts = {symbols[ff]}

              if encoding and encoding ~= "" then
                table.insert(parts, encoding)
              end

              if filetype and filetype ~= "" then
                if icon then
                  table.insert(parts, icon .. ' ' .. filetype)
                else
                  table.insert(parts, filetype)
                end
              end

              return table.concat(parts, " | ")
            end,
          }
        }
      }
    })
  end
}
