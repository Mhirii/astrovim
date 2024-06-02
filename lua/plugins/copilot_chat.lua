return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  cmd = "CopilotChat",
  dependencies = {
    "AstroNvim/astrocore",

    opts = function(_, opts)
      local maps = opts.mappings

      maps.n["<leader>a"] = { desc = " Copilot" }

      maps.n["<M-c>"] = {
        function() return require("CopilotChat").toggle() end,
        desc = "Toggle CopilotChat",
      }
      maps.v["<M-c>"] = {
        function() return require("CopilotChat").toggle() end,
        desc = "Toggle CopilotChat",
      }
      maps.v["<leader>ah"] = {
        function()
          local actions = require "CopilotChat.actions"
          require("CopilotChat.integrations.telescope").pick(actions.help_actions())
        end,
        desc = "CopilotChat - Help actions",
      }
      maps.n["<leader>ah"] = {
        function()
          local actions = require "CopilotChat.actions"
          require("CopilotChat.integrations.telescope").pick(actions.help_actions())
        end,
        desc = "CopilotChat - Help actions",
      }
      maps.v["<leader>ap"] = {
        function()
          local actions = require "CopilotChat.actions"
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      }
      maps.n["<leader>ap"] = {
        function()
          local actions = require "CopilotChat.actions"
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      }

      maps.n["<leader>ai"] = {
        function()
          local input = vim.fn.input "Quick Chat: "
          if input ~= "" then require("CopilotChat").ask(input) end
        end,
        desc = "CopilotChat - Quick Chat",
      }
      maps.v["<leader>ai"] = {
        function()
          local input = vim.fn.input "Quick Chat: "
          if input ~= "" then require("CopilotChat").ask(input) end
        end,
        desc = "CopilotChat - Quick Chat",
      }

      maps.n["<leader>ae"] = { "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" }
      maps.v["<leader>ae"] = { "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" }
      maps.n["<leader>at"] = { "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" }
      maps.v["<leader>at"] = { "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" }
      maps.n["<leader>af"] = { "<cmd>CopilotChatFix<cr>", desc = "CopilotChat - Fix code" }
      maps.v["<leader>af"] = { "<cmd>CopilotChatFix<cr>", desc = "CopilotChat - Fix code" }
      maps.n["<leader>ar"] = { "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" }
      maps.v["<leader>ar"] = { "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" }
      maps.n["<leader>ao"] = { "<cmd>CopilotChatOptimize<cr>", desc = "CopilotChat - Optimize code" }
      maps.v["<leader>ao"] = { "<cmd>CopilotChatOptimize<cr>", desc = "CopilotChat - Optimize code" }
      maps.n["<leader>ad"] = { "<cmd>CopilotChatDocs<cr>", desc = "CopilotChat - Generate Docs" }
      maps.v["<leader>ad"] = { "<cmd>CopilotChatDocs<cr>", desc = "CopilotChat - Generate Docs" }
      maps.n["<leader>av"] = { ":CopilotChatVisual", desc = "CopilotChat - Open in vertical split" }
      maps.v["<leader>av"] = { ":CopilotChatVisual", desc = "CopilotChat - Open in vertical split" }
      maps.n["<leader>ax"] = { ":CopilotChatInline<cr>", desc = "CopilotChat - Inline chat" }
      maps.v["<leader>ax"] = { ":CopilotChatInline<cr>", desc = "CopilotChat - Inline chat" }
      maps.n["<leader>aq"] = {
        function()
          local input = vim.fn.input "Quick Chat: "
          if input ~= "" then vim.cmd("CopilotChatBuffer " .. input) end
        end,
        desc = "CopilotChat - Quick chat",
      }
      maps.v["<leader>aq"] = {
        function()
          local input = vim.fn.input "Quick Chat: "
          if input ~= "" then vim.cmd("CopilotChatBuffer " .. input) end
        end,
        desc = "CopilotChat - Quick chat",
      }
      maps.n["<leader>ac"] = { "<cmd>CopilotChatCommit<cr>", desc = "CopilotChat - Commit Message" }
      maps.v["<leader>ac"] = { "<cmd>CopilotChatCommit<cr>", desc = "CopilotChat - Commit Message" }
      maps.n["<leader>as"] = { "<cmd>CopilotChatCommitStaged<cr>", desc = "CopilotChat - Commit Message Staged" }
      maps.v["<leader>as"] = { "<cmd>CopilotChatCommitStaged<cr>", desc = "CopilotChat - Commit Message Staged" }
      maps.n["<leader>aF"] = { "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" }
      maps.v["<leader>aF"] = { "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" }
      maps.n["<leader>aR"] = { "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" }
      maps.v["<leader>aR"] = { "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" }
      maps.n["<leader>av"] = { "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle Vsplit" }
      maps.v["<leader>av"] = { "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle Vsplit" }
    end,
  },
  opts = function()
    local user = vim.env.USER or "User"
    user = user:sub(1, 1):upper() .. user:sub(2)
    return {
      model = "gpt-4",
      auto_insert_mode = true,
      show_help = true,
      question_header = "  " .. user .. " ",
      answer_header = "  Copilot ",
      window = {
        width = 0.4,
      },
      selection = function(source)
        local select = require "CopilotChat.select"
        return select.visual(source) or select.buffer(source)
      end,
    }
  end,
  keys = {
    x = {},
  },
  config = function(_, opts)
    local chat = require "CopilotChat"
    require("CopilotChat.integrations.cmp").setup()

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "copilot-chat",
      callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
      end,
    })

    chat.setup(opts)
  end,
}
