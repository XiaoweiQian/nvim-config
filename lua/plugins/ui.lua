return {
  -- 导航条跳转
  { "Bekaboo/dropbar.nvim", event = "BufReadPost", keys = { { "<leader>db", "<cmd>lua require('dropbar.api').pick()<CR>", desc = "Pick Dropbar" } } },

  -- 状态栏显示
  { "nvim-lualine/lualine.nvim", event = "VimEnter", config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "kanagawa",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = {}, winbar = {} },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = { statusline = 1000, tabline = 1000, winbar = 1000 },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end },
  -- Buffer 导航
  { "romgrk/barbar.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, event = "BufRead", config = function()
    require("barbar").setup({
      icons = { filetype = { enabled = true } },
      sidebar_filetypes = {
        NvimTree = { text = "File Explorer", align = "center" },
      },
    })
  end, keys = {
    { "<leader>bb", "<cmd>BufferPick<CR>", desc = "Pick Buffer" },
    { "<leader>bc", "<cmd>BufferClose<CR>", desc = "Close Buffer" },
    { "<leader>bn", "<cmd>BufferNext<CR>", desc = "Pick Buffer" },
    { "<leader>bp", "<cmd>BufferPrevious<CR>", desc = "Close Buffer" },
  } },
  { "folke/tokyonight.nvim", lazy = true },
  { "navarasu/onedark.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", config = function() vim.cmd.colorscheme("kanagawa-wave") end },
}
