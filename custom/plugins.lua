local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- Override plugin configs

  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },


  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },


  -- Install plugins

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
    "nathom/tmux.nvim",
  },

  {
    "nvimtools/none-ls.nvim",
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
}

return plugins

--
--   {
--     'nvim-telescope/telescope-fzf-native.nvim',
--     build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
--   },
--   {
-- 	  "nvim-telescope/telescope.nvim",
-- ---@diagnostic disable-next-line: unused-local
--     config = function(_, opts)
--       require('telescope').load_extension('fzf')
--     end,
--   },
--   {
--     "rcarriga/nvim-dap-ui",
--     dependencies = "mfussenegger/nvim-dap",
--     config = function()
--       local dap = require("dap")
--       local dapui = require("dapui")
--       dapui.setup()
--       dap.listeners.after.event_initialized["dapui_config"] = function()
--         dapui.open()
--       end
--       dap.listeners.after.event_terminated["dapui_config"] = function()
--         dapui.close()
--       end
--       dap.listeners.after.event_exited["dapui_config"] = function()
--         dapui.close()
--       end
--     end
--   },
--   {
--     "mfussenegger/nvim-dap",
-- ---@diagnostic disable-next-line: unused-local
--     config = function(_, opts)
--       require("core.utils").load_mappings("dap")
--     end
--   },
--   {
--     "mfussenegger/nvim-dap-python",
--     ft = "python",
--     dependencies = {
--       "mfussenegger/nvim-dap",
--       "rcarriga/nvim-dap-ui",
--     },
-- ---@diagnostic disable-next-line: unused-local
--     config = function(_, opts)
--       local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
--       require("dap-python").setup(path)
--       require("core.utils").load_mappings("dap_python")
--     end,
--   },
-- }
--
-- return plugins
