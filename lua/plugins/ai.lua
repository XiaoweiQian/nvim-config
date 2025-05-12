local system_prompt_info = [[
你是 TauriDevPro，一位精通以下技术的全栈开发专家：
- 核心: Tauri 2.0
- 前端: React (TSX, Functional Components, Hooks), Vite, TypeScript
- UI: shadcn/ui (首选), TailwindCSS (自定义/补充)
- 路由: react-router-dom v6+
- 后端交互: 优先使用 Tauri TypeScript 插件 (@tauri-apps/plugin-*), 其次是 Rust `invoke`.

任务指令：
1. UI实现：必须优先使用官方 shadcn/ui 组件。若需自定义或 shadcn/ui 未覆盖，则使用 TailwindCSS。
2. 后端交互：必须优先使用 Tauri TypeScript 插件。若插件不适用，再考虑 `invoke`。
3. 代码：提供类型安全 (TypeScript)、遵循 React 最佳实践的可读代码。
4. 解释：简明扼要地解释关键实现和选择。

请基于此技术栈和偏好回应后续所有编程请求。
]]

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  },

  { 
    "yetone/avante.nvim", 
    version = false, -- Never set this value to "*"! Never!
    event = "VeryLazy", 
    opts = {
      -- gemini
      provider = "gemini",
      system_prompt = system_prompt_info,
      rag_service = {
        enabled = false, -- Enables the rag service, requires OPENAI_API_KEY to be set
        host_mount = os.getenv("HOME"), -- Host mount path for the rag service (docker will mount this path)
        runner = "docker", -- The runner for the rag service, (can use docker, or nix)
        provider = "ollama", -- The provider to use for RAG service. eg: openai or ollama
        llm_model = "Gemma 3", -- The LLM model to use for RAG service
        embed_model = "nomic-embed-text", -- The embedding model to use for RAG service
        endpoint = "http://localhost:11434", -- The API endpoint for RAG service
        docker_extra_args = "", -- Extra arguments to pass to the docker command
      },
      gemini= {
          --model = 'gemini-2.5-flash-preview-04-17',
          model = 'gemini-2.5-pro-preview-05-06',
          proxy = "http://127.0.0.1:6152", -- proxy support, e.g., http://127.0.0.1:7890
          timeout = 30000000,
          temperature = 0,
          max_tokens = 1000000,
        },
    },
    build = "make", 
    dependencies = { 
      "nvim-treesitter/nvim-treesitter", 
      "stevearc/dressing.nvim", 
      "nvim-lua/plenary.nvim", 
      "MunifTanjim/nui.nvim", 
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    }, 
    keys = {
      { "<leader>aa", ":AvanteAsk<CR>", desc = "Ask Avante" },
      { "<leader>at", ":AvanteToggle<CR>", desc = "toggle Avante" },
      { "<leader>ae", ":AvanteEdit<CR>", desc = "Edit with Avante" },
      { "<leader>ar", ":AvanteRefresh<CR>", desc = "Refresh Avante" },
      { "<leader>ac", ":AvanteClear<CR>", desc = "Clear Avante" },
      { "<leader>an", ":AvanteChatNew<CR>", desc = "New Chat Avante" },
      { "<leader>af", ":AvanteFocus<CR>", desc = "Focus Avante" },
      { "<leader>ah", ":AvanteHistory<CR>", desc = "History Avante" },
    },
  },
}
