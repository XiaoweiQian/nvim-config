return {
  -- 平滑滑动
  { "karb94/neoscroll.nvim", 
    config = function() 
      require("neoscroll").setup({ mappings = {} }) 
      neoscroll = require('neoscroll')
      local keymap = {
        ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 250 }) end;
        ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 250 }) end;
      }
      local modes = { 'n', 'v', 'x' }
      for key, func in pairs(keymap) do
        vim.keymap.set(modes, key, func)
      end
    end 
  },
  -- 批量注释,3gcc 3gbc
  { "numToStr/Comment.nvim", event = "BufReadPost", opts = {}, keys = { { "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", desc = "Toggle Comment" } } },
  -- 指向同名方法和变量，方便跳转
  { "RRethy/vim-illuminate", event = "BufReadPost", keys = {
    { "<leader>n", "<cmd>lua require('illuminate').goto_next_reference(true)<CR>", desc = "Next Reference" },
    { "<leader>p", "<cmd>lua require('illuminate').goto_prev_reference(true)<CR>", desc = "Prev Reference" },
  } },
  -- 方便写成对的符号和标签
  { "tpope/vim-surround", event = "BufReadPost" },
  -- 批量修改和替换
  { "nvim-pack/nvim-spectre", event = "VeryLazy", keys = {
    { "<leader>S", "<cmd>lua require('spectre').toggle()<CR>", desc = "Toggle Spectre" },
    { "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", desc = "Search Current Word" },
    { "<leader>sp", "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", desc = "Search Current File" },
  } },
  --[[
  -- 垂直指引线对齐，方便看结构
  { "lukas-reineke/indent-blankline.nvim", event = "BufReadPost", config = function() require("indent_blankline").setup({ char = "│", show_current_context = true }) end },
  --]]
}
