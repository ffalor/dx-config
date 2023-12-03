local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "c",
    "go",
    "gosum",
    "gomod",
    "gowork",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    "python",
    "gitignore",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- go stuff
    "gopls",
    "delve",
    "golangci-lint",
    "goimports",
    "golines",

    -- python stuff
    "pyright",
    "mypy",
    "ruff",
    "black",
  },
}

-- git support in nvimtree
M.nvimtree = {
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
