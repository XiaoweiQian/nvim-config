return {
  { "williamboman/mason.nvim", config = function() require("mason").setup() end },
  { "williamboman/mason-lspconfig.nvim", config = function() require("mason-lspconfig").setup({ ensure_installed = { "rust_analyzer", "ts_ls" } }) end },
  -- lsp 默认插件配置
  { "neovim/nvim-lspconfig", config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    require("lspconfig").rust_analyzer.setup({ capabilities = capabilities })
    require("lspconfig").ts_ls.setup({ capabilities = capabilities })

    local signs = { Error = "", Warn = "", Hint = " ", Info = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

  end },

  -- lsp 进度浮窗提示
  { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
  -- 语法高亮，核心插件
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "rust", "python", "javascript", "html", "toml", "yaml", "css", "typescript" },
      sync_install = true,
      highlight = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
          scope_incremental = "<TAB>",
        },
      },
      indent = { enable = true },
    })
  end },
}
