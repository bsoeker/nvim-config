local M = {}
M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.on_attach = function(client, bufnr)
  require("lsp_signature").on_attach({
    bind = true,
    floating_window = true,
    hint_enable = false,
    handler_opts = { border = "rounded" },
  }, bufnr)
end

-- slang-server(verilog/systemverilog)
vim.lsp.config["slang-server"] = {
  cmd = { "slang-server" },
  filetypes = { "systemverilog", "verilog" },
  root_markers = { ".git", ".slang" },
  on_attach = M.on_attach,
  capabilities = M.capabilities
}
vim.lsp.enable("slang-server")


-- clangd (C / C++)
vim.lsp.config["clangd"] = {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "cuda" },
  root_markers = { "compile_commands.json", ".git" },
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}
vim.lsp.enable("clangd")

-- basedpyright (Python)
vim.lsp.config["basedpyright"] = {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}
vim.lsp.enable("basedpyright")

-- jdtls (Java)
vim.lsp.config["jdtls"] = {
  cmd = { "jdtls" },
  filetypes = { "java" },
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}
vim.lsp.enable("jdtls")

-- ts_ls (TypeScript / JavaScript, faster than ts_ls)
vim.lsp.config["ts_ls"] = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  capabilities = M.capabilities,
  on_attach = M.on_attach,
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
  on_attach = M.on_attach,
  capabilities = M.capabilities
}
vim.lsp.enable("gopls")

-- ruby-lsp
vim.lsp.config["ruby-lsp"] = {
  cmd = { "ruby-lsp" },
  filetypes = { "ruby" },
  init_options = {
    formatter = "auto"
  },
  on_attach = M.on_attach,
  capabilities = M.capabilities
}
vim.lsp.enable("ruby-lsp")

-- metals (scala)
vim.lsp.config["metals"] = {
  cmd = { "metals" },
  filetypes = { "scala" },
  on_attach = M.on_attach,
  capabilities = M.capabilities
}
vim.lsp.enable("metals")

-- rust-analyzer
vim.lsp.config["rust-analyzer"] = {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", ".git" },
  on_attach = M.on_attach,
  capabilities = M.capabilities,
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
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = { checkThirdParty = false },
      hint = { enable = true },
    },
  },
}
vim.lsp.enable("lua_ls")

return M
