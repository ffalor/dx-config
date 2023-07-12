---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["J"] = { "mzJ`z", "Move line below to current line" },
    ["<C-d>"] = { "<C-d>zz", "Jump half page down and center" },
    ["<C-u"] = { "<C-u>zz", "Jump half page up and center" },
    ["n"] = { "nzzzv", "Next search term" },
    ["N"] = { "Nzzzv", "Previous search term" },
    ["<leader>rw"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Replace a word everywhere" },
  },
  v = {
    ["<leader>y"] = { '"+y', "Yank to system register" },
    ["J"] = { ":m '>+1<CR>gv=gv", "Move block down and indent" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move block up and indent" },
  },
  x = {
    ["<leader>p"] = { '"_dP', "Replace paste without copy to registery" },
  },
}

M.telescope = {
 n = {
    ["<leader>fg"] = { "<cmd> Telescope git_files <CR>", "Find project files" },
  }
}

return M
