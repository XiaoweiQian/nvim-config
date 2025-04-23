return {
  { 
    "yetone/avante.nvim", 
    version = false, -- Never set this value to "*"! Never!
    event = "VeryLazy", 
    opts = {
    -- add any opts here
    -- openrouter
    --[[
    provider = "openrouter",
    vendors = {
      openrouter = {
        __inherited_from = 'openai',
        endpoint = 'https://openrouter.ai/api/v1',
        api_key_name = 'key',
        model = 'google/gemini-2.5-flash-preview',
      },
    },
    --]]
    -- gemini
    provider = "gemini",
    gemini= {
        model = 'gemini-2.5-flash-preview-04-17',
      },
    },
    build = "make", 
    dependencies = { 
      "nvim-treesitter/nvim-treesitter", 
      "stevearc/dressing.nvim", 
      "nvim-lua/plenary.nvim", 
      "MunifTanjim/nui.nvim", 
    }, 
    keys = {
      { "<leader>aa", ":AvanteAsk<CR>", desc = "Ask Avante" },
      { "<leader>ae", ":AvanteEdit<CR>", desc = "Edit with Avante" },
      { "<leader>ar", ":AvanteRefresh<CR>", desc = "Refresh Avante" },
    }
  },
}
