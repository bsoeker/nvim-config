return {
  "scalameta/nvim-metals",
  dependencies = { "j-hui/fidget.nvim" },
  ft = { "scala", "sbt" },
  opts = function()
    local shared = require("config.lsp")
    local metals_config = require("metals").bare_config()

    metals_config.capabilities = shared.capabilities
    metals_config.on_attach = function(client, bufnr)
      shared.on_attach(client, bufnr)
      require("metals").setup_dap()
    end

    metals_config.settings = {
      showImplicitArguments = true,
      excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
    }
    metals_config.init_options.statusBarProvider = "off"

    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
}
