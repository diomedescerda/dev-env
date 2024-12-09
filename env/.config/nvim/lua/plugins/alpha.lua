return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.type = "group"
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#311B92" })    -- Indigo
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#512DA8" })    -- Deep Purple
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#673AB7" })    -- Deep Purple
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#9575CD" })    -- Medium Purple
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#B39DDB" })    -- Light Purple
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = "#D1C4E9" })    -- Very Light Purple
    vim.api.nvim_set_hl(0, "NeovimDashboardUsername", { fg = "#D1C4E9" }) -- light purple

    dashboard.section.header.val = {
      {
        type = "text",
        val = "██╗  ██╗███████╗███╗   ██╗███╗   ███╗ █████╗ ",
        opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "██║ ██╔╝██╔════╝████╗  ██║████╗ ████║██╔══██╗",
        opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "█████╔╝ █████╗  ██╔██╗ ██║██╔████╔██║███████║",
        opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "██╔═██╗ ██╔══╝  ██║╚██╗██║██║╚██╔╝██║██╔══██║",
        opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "██║  ██╗███████╗██║ ╚████║██║ ╚═╝ ██║██║  ██║",
        opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝  ╚═╝",
        opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" },
      },
      {
        type = "padding",
        val = 1,
      },
      {
        type = "text",
        val = "孤爪研磨",
        opts = { hl = "NeovimDashboardUsername", shrink_margin = false, position = "center" },
      },
    }

    dashboard.section.buttons.val = {
      dashboard.button("n", " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
      dashboard.button("f", " " .. " Find file", "<cmd> Telescope find_files <cr>"),
      dashboard.button("r", " " .. " Recent files", "<cmd> Telescope oldfiles <cr>"),
      dashboard.button("s", " " .. " Find text", "<cmd> Telescope live_grep <cr>"),
      dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
    ]])
  end,
}
