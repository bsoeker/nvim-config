local treesitterConfig = require('nvim-treesitter.configs')
treesitterConfig.setup {
    -- List of parsers to be installed
    ensure_installed = { 'lua', 'cpp', 'c', 'javascript', 'typescript', 'java', 'python', 'html', 'css', 'verilog', 'rust', 'vhdl' },
    sync_install = false,

    -- Enable syntax highlighting
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    indent = { enable = true },
    fold = { enable = true },

    -- Enable incremental selection
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",    -- Start incremental selection
            node_incremental = "grn",  -- Expand to the next syntax node
            node_decremental = "grm",  -- Shrink to the previous syntax node
            scope_incremental = "grc", -- Expand to the current scope
        },
    },
    refactor = {
        highlight_definitions = {
            enable = true, -- Highlights the definition under the cursor
        },
        highlight_current_scope = {
            enable = false, -- Optionally highlight the current scope
        },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
        navigation = {
            enable = true,                         -- Enables navigation between references
            keymaps = {
                goto_definition = "gnd",           -- Jump to definition
                list_definitions = "gnD",          -- List definitions
                list_definitions_toc = "gO",       -- List definitions in a TOC
                goto_next_usage = "<leader>j",     -- Jump to the next usage
                goto_previous_usage = "<leader>k", -- Jump to the previous usage
            },
        },
    },
}
