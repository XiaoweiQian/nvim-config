return {
  { "nvim-tree/nvim-tree.lua", event = "VimEnter", config = function() require("nvim-tree").setup({ update_focused_file = { enable = true } }) end, keys = { { "<leader>e", ":NvimTreeOpen<CR>", desc = "Open NvimTree" } } },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, event = "VeryLazy", config = function()
    require("telescope").setup({})
  end, keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },
    { "<leader>fc", "<cmd>Telescope grep_string<CR>", desc = "Grep Current Word" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Grep Current Word" },
    { "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", desc = "Grep Current Word" },
    { "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", desc = "Grep Current Word" },
    { "<leader>gr", "<cmd>Telescope lsp_references<CR>", desc = "Grep Current Word" },
    { "<leader>gD", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Grep Current Word" },
    { "<leader>ge", "<cmd>Telescope diagnostics<CR>", desc = "Grep Current Word" },
  } },
  -- 快速移动
  { "folke/flash.nvim", event = "VeryLazy", opts = {}, 
    keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  -- outline 
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    config = function() require("outline").setup({ } ) end, 
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
    },
  },
}
