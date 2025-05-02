return {
  -- 基础库
  { "nvim-lua/plenary.nvim" },
  -- 图标icon
  { "nvim-tree/nvim-web-devicons" },
  -- markdown 预览
  { "iamcco/markdown-preview.nvim", ft = "markdown", build = ":call mkdp#util#install()" },
  -- 彩虹括号
  { "HiPhish/rainbow-delimiters.nvim", event = "BufReadPost" },
  -- 快捷键提示
  { "folke/which-key.nvim", event = "VeryLazy", init = function() vim.o.timeout = true; vim.o.timeoutlen = 1000 end, opts = {} },
  -- 根据文件动态tab和shift 缩进
  { "tpope/vim-sleuth", event = "BufReadPost" },
  -- 括号自动补全
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
}
