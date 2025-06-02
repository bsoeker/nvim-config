local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.vhdl = {
    install_info = {
        url = "https://github.com/entler/tree-sitter-vhdl", -- where to get the parser
        files = { "src/parser.c" },                         -- which source files to compile
        branch = "main",                                    -- which branch to use
    },
    filetype = "vhdl",                                      -- associates this parser with .vhd/.vhdl files
}
