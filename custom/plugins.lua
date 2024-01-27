local plugins = {
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      -- vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {

  "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                work = "~/.geistesblitze/work",
                ideen = "~/.geistesblitze/ideen",
                erudition = "~/.geistesblitze/erudition",
              },
            },
          },
        },
      }
    end,
    lazy = false
  },
  {
	  "tpope/vim-rhubarb",
    lazy = false
  },
  {
    'jabirali/vim-tmux-yank',
    lazy = false
  },
  {
	  "tpope/vim-fugitive",
    lazy = false
  },
  {
	  "mbbill/undotree",
    lazy = false
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  {
	  "nvim-telescope/telescope.nvim",
---@diagnostic disable-next-line: unused-local
    config = function(_, opts)
      require('telescope').load_extension('fzf')
    end,
  },
  {
	  "nathom/tmux.nvim",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cmake",
        "cpp",
        "dockerfile",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "ruby",
        "rust",
        "typescript",
        "yaml",
        "go",
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.after.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.after.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
---@diagnostic disable-next-line: unused-local
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
---@diagnostic disable-next-line: unused-local
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {
      "cmake",
      "cpp",
      "markdown",
      "python",
      "rst",
      "ruby",
      "sh",
      "go",
    },
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "clang-format",
        "clangd",
        "cmake-language-server",
        "cmakelang",
        "codespell",
        "debugpy@1.6.7",
        "lua-language-server",
        "mypy",
        --"prettier@2.8.8",
        --"pyright",
        "rstcheck",
        "rubocop",
        "ruff",
        "shfmt",
        "solargraph",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
}

return plugins
