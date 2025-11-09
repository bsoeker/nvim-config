local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
  require("lsp_signature").on_attach({
    bind = true,
    floating_window = true,
    hint_enable = false,
    handler_opts = { border = "rounded" },
  }, bufnr)
end

-- clangd (C / C++)
vim.lsp.config["clangd"] = {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "cuda" },
  root_markers = { "compile_commands.json", ".git" },
  on_attach = on_attach,
  capabilities = capabilities,
}
vim.lsp.enable("clangd")

-- pyright (Python)
vim.lsp.config["pyright"] = {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  on_attach = on_attach,
  capabilities = capabilities,
}
vim.lsp.enable("pyright")

-- ts_ls (TypeScript / JavaScript, faster than ts_ls)
vim.lsp.config["ts_ls"] = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    typescript = {
      inlayHints = { parameterNames = { enabled = "none" } }, -- lighter than "all"
    },
    javascript = {
      inlayHints = { parameterNames = { enabled = "none" } },
    },
  },
}
vim.lsp.enable("ts_ls")

-- gopls
vim.lsp.config["gopls"] = {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  on_attach = on_attach,
  capabilities = capabilities
}
vim.lsp.enable("gopls")

-- ruby-lsp
vim.lsp.config["ruby-lsp"] = {
  cmd = { "ruby-lsp" },
  filetypes = { "ruby" },
  init_options = {
    formatter = "auto"
  },
  on_attach = on_attach,
  capabilities = capabilities
}
vim.lsp.enable("ruby-lsp")


-- rust-analyzer
vim.lsp.config["rust-analyzer"] = {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", ".git" },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
    },
  },
}
vim.lsp.enable("rust-analyzer")

-- lua-language-server
vim.lsp.config["lua_ls"] = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = { checkThirdParty = false },
      hint = { enable = true },
    },
  },
}
vim.lsp.enable("lua_ls")
