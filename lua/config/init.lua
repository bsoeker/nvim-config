require('config.lazy')
require('config.keymaps')
require('config.lsp')
require('config.completions')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.cmd.colorscheme("tokyonight-night")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 4

vim.wo.number = true
vim.o.relativenumber = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.g.clipboard = {
	name = "xclip",
	copy = {
		["+"] = "xclip -selection clipboard",
		["*"] = "xclip -selection clipboard",
	},
	paste = {
		["+"] = "xclip -selection clipboard -o",
		["*"] = "xclip -selection clipboard -o",
	},
	cache_enabled = 0,
}

-- Format on Save
vim.cmd([[
  augroup FormatOnSave
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })
  augroup END
]])

vim.lsp.inlay_hint.enable(true)

-- reduce cursore update time so the reference highlight works quicker
vim.opt.updatetime = 200

-- document highlighting
-- This code is unnecessary with the nvim-treesitter-refactor plugin
--
--
-- vim.api.nvim_create_autocmd('LspAttach', {
-- 	callback = function(args)
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		if client.server_capabilities.documentHighlightProvider then
-- 			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
-- 				buffer = args.buf, -- Attach to the current buffer
-- 				callback = vim.lsp.buf.document_highlight,
-- 			})
-- 			vim.api.nvim_create_autocmd('CursorMoved', {
-- 				buffer = args.buf, -- Attach to the current buffer
-- 				callback = vim.lsp.buf.clear_references,
-- 			})
-- 		end
-- 	end,
-- })
