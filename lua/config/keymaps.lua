-- NvimTree
vim.keymap.set('n', '<leader>ee', ':NvimTreeToggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>ef', ':NvimTreeFocus<CR>', { silent = true })

-- Moving lines
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- Duplicate the current line
vim.api.nvim_set_keymap("n", "<leader>d", ":t.<CR>", { noremap = true, silent = true })

-- Yank to clipboard
vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>Y', '\"+Y')

-- Write & quit
vim.keymap.set('n', '<leader>w', ":w<CR>")
vim.keymap.set('n', '<leader>q', ":q<CR>")

-- Git
vim.keymap.set('n', '<leader>git', vim.cmd.Git)

-- Colorschemes
vim.keymap.set('n', '<leader>cd', ':colorscheme dracula<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ct', ':colorscheme tokyonight-night<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cp', ':colorscheme poimandres<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ci', ':colorscheme iceberg<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cr', ':colorscheme rose-pine<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ccy', ':colorscheme cyberdream<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cca', ':colorscheme carbonfox<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cf', ':colorscheme fluoromachine<CR>', { noremap = true, silent = true })

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
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>ca", ':Lspsaga code_action<CR>', opts)
vim.keymap.set("n", "<leader>t", ':Lspsaga term_toggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fr', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>',
	{ noremap = true, silent = true })

-- Inlay hint toggle
vim.keymap.set('n', '<leader>ih', ':lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>',
	{ noremap = true, silent = true })
