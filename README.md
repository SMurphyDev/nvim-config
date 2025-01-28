# Neovim config using Lazy package mangager and Mason

This is my work in progress neovim config, put this together over as a weekend project, so use at your own risk! It's 
set up to use Lazy for configuration and plugin mangement, with Mason for language server installation and
configuration, in addition to a handful of other quality of life packages for fuzzy search and tooltips etc. You might
find this useful as a starting out point for developing your own config.

## Pre-requisites

Install each of these by following their respective install instructions.

1. [Nerd Fonts](https://www.nerdfonts.com/) - Needed so that icons display correctly
2. [python](https://www.python.org/) - Some plugins, like wilder assume python is installed and will fail to load if its not
3. [node](https://nodejs.org/en/download) - sqlls language server is a node package. If you don't need it update lsp.spec.config to remove it.

Note, on windows don't install python from the windows store, use choco or download it from the python website directly.
There's sometimes an issue where the executable won't be detectable by nvim due to the weird path and naming scheme of
store installed applications.

### Mac

We need to install dev tools if you haven't already. Some of the plugins automatically installed will require a c
compiler and build chain to install. Run the following in your command line:

```
xcode-select install
```


### Linux

As with on mac, some of the plugins require make and a c compiler to build and install, so we need to install build
essentials. We also need to install unzip, if it's not present stylua will fail to install.

Most distros have an outdated version of neovim in the repo. Ubuntu is still on version 0.6! You'll need to install
from the experimental repo. I provide instructions for ubuntu/debian like distros here, You'll have to adapt these
instructions if you are using a different distro.

For ubuntu/mint/debian:

```
# Install neovim latest version
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

# Install build tools
sudo apt-get install build-essential

# Install unzip
sudo apt-get install unzip

```

### Windows

We'll need to install chocolately so that we can pull in dev tools to get all of our plugins to work.
[choco](https://chocolatey.org/install#individual)

I recommend disabling app execution aliases for python. Windows extremely insistent on routing you to the store otherwise
even if you already have python installed by another means already. See [here](https://stackoverflow.com/questions/58754860/cmd-opens-windows-store-when-i-type-python) for  how.

In powershell runng as admin after installing chocolatey:

```
choco install make
choco install mingw 
```

## installation

Once you have your chosen nerd font installed you should only need to clone this to your nvim config directory.
config/lazy.lua bootstraps the package manager which in turn should install everything else once you run nvim.

On linux/mac clone to: ~/.config/nvim/

On windows clone to: %AppData%\Local\nvim\

```
git clone https://github.com/SMurphyDev/nvim-config.git .
nvim init.lua
```

At this point you should have an open nvim instance with all packages listed below installed. You can play around with
the config files, each time you re-launch nvim your changes should be applied and any new plugins will be isntalled.
You may need to periodically run MasonClean to uninstall unused lsp or tools.

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

1.  [neanias/everforest-nvim](https://github.com/neanias/everforest-nvim) - a nice green theme
2.  [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim) - a neat buffer based file manager
3.  [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - pair matching for brackets, strings, etc.
4.  [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) - text highlighter
5.  [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - a nicer status line
6.  [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - fuzzy searching
7.  [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) - integrated pop up terminals
8.  [gelguy/wilder.nvim](https://github.com/gelguy/wilder.nvim) - search suggextions for the status line
9.  [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - treesitter makes the editor more language aware
10. [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - manages external packages such as lsps and linters
11. [WhoIsSethDaniel/mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) - specific plugin for installing external tools. These are required to provide functionality to certain langauge servers.
12. [williamboman/mason-lspconfig](https://github.com/williamboman/mason-lspconfig) - automates lsp installation
13. [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - helper mopdule for lsp configuration
14. [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Code completion with lsp integration
15. [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) - Code formating
