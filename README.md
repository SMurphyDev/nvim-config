# Neovim config using Lazy package mangager and Mason

This is my work in progress neovim config, put this together over as a weekend project, so use at your own risk! It's 
set up to use Lazy for configuration and plugin mangement, with Mason for language server installation and
configuration, in addition to a handful of other quality of life packages for fuzzy search and tooltips etc. You might
find this useful as a starting out point for developing your own config.

## Pre-requisites

Install each of these by following their respective install instructions.

1. [Nerd Fonts](https://www.nerdfonts.com/) - Needed so that icons display correctly
2. [Lazy](https://github.com/folke/lazy.nvim) - Plugin mangager

## installation

Once you have your chose nerd font installed you should only need to clone this to your nvim config directory.
config/lazy.lua bootstraps the package manager which in turn should install everything else once you run nvim. 

On linux/mac clone to: ~/.config/nvim/ 
On windows clone to: %AppData%\Local\nvim\

## What will be installed?

### Language Servers

You can add, remove, or change the configuration for lsps in plugins/lsp.spec.lua. I highly recommend you play around
with it until it suits your needs.

1. [bashls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#bashls) - bash script support
2. [dockerls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#dockerls) - dockerfile support
3. [jdtls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#jdtls) - java support
4. [jsonls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#jsonls) - json support
5. [lua_ls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls) - lua language support
6. [marksman](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#marksman) - mardown support
7. [pyright](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#pyright) - python support
8. [sqlls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#sqlls) - sql support

### Neo vim plugins

1.  [neanias/everforest-nvim]("https://github.com/neanias/everforest-nvim") - a nice green theme
2.  [stevearc/oil.nvim]("https://github.com/stevearc/oil.nvim") - a neat buffer based file manager
3.  [windwp/nvim-autopairs]("https://github.com/windwp/nvim-autopairs") - pair matching for brackets, strings, etc.
4.  [norcalli/nvim-colorizer.lua]("https://github.com/norcalli/nvim-colorizer.lua") - text highlighter
5.  [nvim-lualine/lualine.nvim]("https://github.com/nvim-lualine/lualine.nvim") - a nicer status line
6.  [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - fuzzy searching
7.  [akinsho/toggleterm.nvim]("https://github.com/akinsho/toggleterm.nvim") - integrated pop up terminals
8.  [gelguy/wilder.nvim]("https://github.com/gelguy/wilder.nvim") - search suggextions for the status line
9.  [nvim-treesitter/nvim-treesitter]("https://github.com/nvim-treesitter/nvim-treesitter") - treesitter makes the editor more language aware
10. [williamboman/mason.nvim]("https://github.com/williamboman/mason.nvim") - manages external packages such as lsps and linters
11. [WhoIsSethDaniel/mason-tool-installer.nvim]("https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim") - specific plugin for installing external tools. These are required to provide functionality to certain langauge servers.
12. [williamboman/mason-lspconfig]("https://github.com/williamboman/mason-lspconfig") - automates lsp installation
13. [neovim/nvim-lspconfig]("https://github.com/neovim/nvim-lspconfig") - helper mopdule for lsp configuration
14. [hrsh7th/nvim-cmp]("https://github.com/hrsh7th/nvim-cmp") - Code completion with lsp integration
15. [stevearc/conform.nvim]("https://github.com/stevearc/conform.nvim") - Code formating
