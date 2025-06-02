return {
    -- the colorscheme should be available when starting Neovim
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "maxmx03/fluoromachine.nvim",
        lazy = false,
        priority = 1000,

    },
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('onedark').setup {
                style = 'deep'
            }
        end
    },
    {
        "olivercederborg/poimandres.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "rose-pine/neovim",
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
    },
    {
        "tomasr/molokai",
        lazy = false,
        priority = 1000,
    },
    {
        "nordtheme/vim",
        name = "nord",
        lazy = false,
        priority = 1000,
    },
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "shaunsingh/moonlight.nvim",
        lazy = false,
        priority = 1000,
    },
}
