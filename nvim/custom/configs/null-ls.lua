local present, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- go
  b.formatting.gofmt.with {
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
  },

  b.formatting.goimports.with {
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
  },

  b.formatting.golines.with {
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
  },
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function (client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({buffer = bufnr})
        end,
      })
    end
  end,
}
