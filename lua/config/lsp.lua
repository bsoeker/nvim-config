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
    cmd = { "clangd", "--completion-style=detailed", "--header-insertion=never" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_markers = { "compile_commands.json", ".git" },
    capabilities = capabilities,
    on_attach = on_attach,
}
vim.lsp.enable("clangd")

-- pyright (Python)
vim.lsp.config["pyright"] = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { ".git" },
    capabilities = capabilities,
    on_attach = on_attach,
}
vim.lsp.enable("pyright")

-- tsserver (TypeScript / JavaScript)
vim.lsp.config["tsserver"] = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        typescript = { inlayHints = { includeInlayParameterNameHints = "all" } },
        javascript = { inlayHints = { includeInlayParameterNameHints = "all" } },
    },
}
vim.lsp.enable("tsserver")

-- rust-analyzer
vim.lsp.config["rust-analyzer"] = {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", ".git" },
    capabilities = capabilities,
    on_attach = on_attach,
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
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            workspace = { checkThirdParty = false },
            hint = { enable = true },
        },
    },
}
vim.lsp.enable("lua_ls")
