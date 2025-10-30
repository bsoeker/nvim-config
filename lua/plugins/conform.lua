-- for python formatting
return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "black" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = false, -- don't touch languages handled by LSP
      },
    })
  end
}
