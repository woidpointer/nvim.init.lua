local M = {}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
	}
}

M.dap_python = {
	plugin = true,
	n = {
		["<leader>dpr"] = {
			function()
				require('dap-python').test_method()
			end
		}
	}
}

M.tmux = {
  n = {
    ["<C-h>"] = {"<cmd>lua require('tmux').move_left()<CR>"},
    ["<C-j>"] = {"<cmd>lua require('tmux').move_down()<CR>"},
    ["<C-k>"] = {"<cmd>lua require('tmux').move_up()<CR>"},
    ["<C-l>"] = {"<cmd>lua require('tmux').move_right()<CR>"}
  }
}

M.diagnostic = {
  n = {
    ["<leader>dp"] = {
      function()
        vim.diagnostic.goto_prev(nil)
      end,
      "[D]iagnostics [P]rev",
      },

    ["<leader>dn"] = {
      function()
        vim.diagnostic.goto_next(nil)
      end,
      "[D]iagnostics [N]ext"
    },

    ["<leader>de"] = {
      function()
        vim.diagnostic.open_float(nil)
      end,
      "[D]iagnostics [E]rror"
    },

    ["<leader>dl"] = {
      function()
        vim.diagnostic.setloclist(nil)
      end,
      "[D]iagnostics [L]oclist"
    },

  },
}

M.zeugs = {
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "Down move with selected block" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Up move with selected block" },
  },

  n = {
    ["J"] = { "mzJ`z", "Keep the cursor at line start when executing the 'J' command" },
  -- Keep the cursor in the middle of the screen when scrolling up/down
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
  },
}

-- vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
M.undotree = {
  n = {
    ["<leader>u"] = {
      function()
        vim.cmd.UndotreeToggle(opts)
      end,
      "Toogle UndoTree"
    },
  },
}

return M
