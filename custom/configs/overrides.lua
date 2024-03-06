local M = {}

M.treesitter = {
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
}

M.mason = {
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
  }
}

M.nvimtree = {
  view = {
    number = true,
    relativenumber = true,
  },
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
