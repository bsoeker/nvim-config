local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client, bufnr)
    require("lsp_signature").on_attach({
        bind = true,
        floating_window = true,
        hint_enable = false,
        handler_opts = { border = "rounded" },
    }, bufnr)
end


vim.lsp.config('ts_ls', {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayVariableTypeHints = false,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayVariableTypeHints = false,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
    }
})

vim.lsp.config('clangd', {
    on_attach = on_attach,
    capabilities = capabilities
})

vim.lsp.config('pyright', {
    on_attach = on_attach,
    capabilities = capabilities
})

vim.lsp.config('rust-analyzer', {
    -- on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = {
                command = "clippy",
            },
        }
    }
})

vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                -- library = vim.api.nvim_get_runtime_file("", true)
            }
        })
    end,
    settings = {
        Lua = {
            hint = {
                enable = true,
            }
        }
    }
})

-- clangd
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
    callback = function(args)
        vim.lsp.start({
            name = "clangd",
            cmd = { "clangd" },
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            on_attach = on_attach,
        })
    end,
})

-- pyright
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    pattern = { "*.py" },
    callback = function(args)
        vim.lsp.start({
            name = "pyright",
            cmd = { "pyright-langserver" },
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            on_attach = on_attach,
        })
    end,
})

-- TypeScript / JavaScript
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
    callback = function(args)
        vim.lsp.start({
            name = "tsserver",
            cmd = { "typescript-language-server", "--stdio" },
            capabilities = capabilities,
        })
    end,
})

-- Rust
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    pattern = { "*.rs" },
    callback = function(args)
        vim.lsp.start({
            name = "rust-analyzer",
            cmd = { "rust-analyzer" },
            capabilities = capabilities,
            settings = {
                ["rust-analyzer"] = {
                    cargo = { allFeatures = true },
                    checkOnSave = { command = "clippy" },
                },
            },
        })
    end,
})

-- Lua
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    pattern = { "*.lua" },
    callback = function(args)
        vim.lsp.start({
            name = "lua_ls",
            cmd = { "lua-language-server" },
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    workspace = { checkThirdParty = false },
                    hint = { enable = true },
                },
            },
        })
    end,
})
