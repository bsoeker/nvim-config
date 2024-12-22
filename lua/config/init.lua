require('config.lazy')
require('config.keymaps')
require('config.lsp')
require('config.completions')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.cmd.colorscheme("cyberdream")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.wo.number = true
vim.o.relativenumber = true

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

vim.cmd([[
  augroup FormatOnSave
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })
  augroup END
]])

vim.lsp.inlay_hint.enable(true)
