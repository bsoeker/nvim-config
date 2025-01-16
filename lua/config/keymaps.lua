-- NvimTree
vim.keymap.set('n', '<leader>ee', ':NvimTreeToggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>ef', ':NvimTreeFocus<CR>', { silent = true })

-- Moving lines
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })

-- Remap for moving in insert mode
vim.keymap.set('i', '<A-h>', '<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '<A-l>', '<Right>', { noremap = true, silent = true })
vim.keymap.set('i', '<A-j>', '<Down>', { noremap = true, silent = true })
vim.keymap.set('i', '<A-k>', '<Up>', { noremap = true, silent = true })

-- Duplicate the current line
vim.keymap.set("n", "<leader>d", ":t.<CR>", { noremap = true, silent = true })

-- Yank to clipboard
vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>Y', '\"+Y')

-- Write & quit
vim.keymap.set('n', '<leader>w', ":w<CR>")
vim.keymap.set('n', '<leader>q', ":q<CR>")

-- Git
vim.keymap.set('n', '<leader>gg', vim.cmd.Git)

-- Colorschemes
vim.keymap.set('n', '<leader>cd', ':colorscheme dracula<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ct', ':colorscheme tokyonight<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cp', ':colorscheme poimandres<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ci', ':colorscheme iceberg<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cr', ':colorscheme rose-pine<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>co', ':colorscheme onedark<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cy', ':colorscheme cyberdream<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cf', ':colorscheme fluoromachine<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cm', ':colorscheme molokai<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cn', ':colorscheme nord<CR>', { noremap = true, silent = true })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- LSP & Lspsaga
local opts = { noremap = true, silent = true, buffer = bufnr }
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>rn", ':Lspsaga rename<CR>', opts)
vim.keymap.set("n", "<leader>ca", ':Lspsaga code_action<CR>', opts)
vim.keymap.set("n", "<leader>t", ':Lspsaga term_toggle<CR>', opts)
vim.keymap.set('n', '<leader>fr', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>',
    { noremap = true, silent = true })






-- Rename selection document-wide
vim.keymap.set("v", "<leader>rn", function()
    -- Yank the visually selected text into the unnamed register
    vim.cmd('normal! "vy')

    -- Get the yanked text (exact visual selection)
    local selected_text = vim.fn.getreg('"')

    -- Print the selected text for debugging
    print("Selected text: " .. selected_text)

    -- Prompt the user for the replacement text
    local new_text = vim.fn.input("Rename '" .. selected_text .. "' to: ")

    -- Perform the substitution only if a valid replacement is provided
    if new_text and #new_text > 0 then
        -- Escape special characters in the selected text for literal matching
        local escaped_selected = vim.fn.escape(selected_text, "\\/.*$^[]~")

        -- Print debugging information
        print("Escaped selected text: " .. escaped_selected)
        print("Replacement text: " .. new_text)

        -- Perform the substitution
        local success, err = pcall(function()
            -- Use `\V` for literal match and global substitution
            vim.cmd(":%s/\\V" .. escaped_selected .. "/" .. new_text .. "/g")
        end)

        -- Handle errors or report success
        if not success then
            print("Error during substitution: " .. err)
        else
            vim.cmd("nohlsearch") -- Clear search highlights after substitution
            vim.cmd("write")      -- Save the file to persist changes
            print("Substitution successful!")
        end
    else
        print("Rename canceled or empty replacement provided.")
    end
end, { noremap = true, silent = true })

-- Remove persisting search highlights
vim.keymap.set("n", "<leader><Esc>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- Inlay hint toggle
vim.keymap.set('n', '<leader>ih', ':lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>',
    { noremap = true, silent = true })

-- Debugging
vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = "Start/Continue Debugging" })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = "Step Over" })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = "Step Into" })
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = "Step Out" })
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, { desc = "Toggle Breakpoint" })

-- Use Alt + hjkl to navigate between panes
vim.keymap.set('n', '<A-h>', '<C-w>h', { desc = "Move to left pane" })
vim.keymap.set('n', '<A-j>', '<C-w>j', { desc = "Move to below pane" })
vim.keymap.set('n', '<A-k>', '<C-w>k', { desc = "Move to above pane" })
vim.keymap.set('n', '<A-l>', '<C-w>l', { desc = "Move to right pane" })
