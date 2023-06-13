local M = {}


-- Disabled default keymappings

M.disabled = {
  n = {
    ["<leader>fz"] = "",
    ["<leader>fw"] = "",
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
    ["<tab>"] = "",
    ["<S-tab>"] = "",
  },

}

M.tabufline = {
  n = {
    ["<leader>l"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<leader>h"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>/"] = {
      "<cmd> Telescope current_buffer_fuzzy_find <CR>",
      "Find in current buffer"
    },

    ["<leader>fw"] = {
      "<cmd> Telescope grep_string <CR>",
      "[F]ind current [W]ord"
    },

    ["<leader>fg"] = {
      "<cmd> Telescope live_grep <CR>",
      "[F]ind by [G]rep"
    },

    ["<leader>fc"] = {
      "<cmd> Telescope git_commits<CR>",
      "[F]ind git [c]ommit"
    },

    ["<leader>fbc"] = {
      "<cmd> Telescope git_bcommits<CR>",
      "[F]ind git [b]uffer [c]ommits"
    },

    ["<leader>fd"] = {
      "<cmd> Telescope diagnostics<CR>",
      "[F]ind [d]iagnostics"
    },
  },
}


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


M.code_navigation = {
  n = {
    ["<leader>jt"] =  {
      function()
        vim.lsp.buf.type_definition()
      end,
      "[j]ump [t]ype definition "
    },

    ["<leader>ji"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "[j]ump [I]mplementation"
    },

    ["<leader>jd"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "[j]ump [D]efinition"
    },

  }

}


-- vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
M.undotree = {
  n = {
    ["<leader>u"] = {
      function()
        vim.cmd.UndotreeToggle({})
      end,
      "Toggle UndoTree"
    },
  },
}


return M
