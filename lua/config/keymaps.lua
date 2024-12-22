vim.keymap.set('n', '<leader>e', ':NvimTreeOpen<CR>', { silent = true })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>Y', '\"+Y')
vim.keymap.set('n', '<leader>w', ":w<CR>")
vim.keymap.set('n', '<leader>q', ":q<CR>")

-- Colorschemes
vim.keymap.set('n', '<leader>cd', ':colorscheme dracula<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ct', ':colorscheme tokyonight<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cp', ':colorscheme poimandres<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ci', ':colorscheme iceberg<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cr', ':colorscheme rose-pine<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cc', ':colorscheme cyberdream<CR>', { noremap = true, silent = true })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- LSP 
local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.api.nvim_set_keymap('n', '<leader>fr', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true })

-- Inlay hint toggle
vim.keymap.set('n', '<leader>ih', ':lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>', { noremap = true, silent = true })
