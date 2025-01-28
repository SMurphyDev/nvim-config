----------------------------------------------
-- Neo-vim config
-- -------------------------------------------

-- General config
-- vim.opt.noswapfile             = true              -- Disable the swap file

-- Session behaviour
vim.opt.ssop                   = "blank,buffers,curdir,help,tabpages,winsize,terminal" -- Default session state to save 

-- Search behaviour
vim.opt.showmatch              = true                -- Show matching  on search
vim.opt.ignorecase             = true                -- Case insensitive search
vim.opt.hlsearch               = true                -- Highlight search terms
vim.opt.incsearch              = true                -- Incremental search

-- UI behaviour
vim.opt.number                 = true                -- Enable line numbers
vim.opt.background             = "dark"              -- Force the use of a dark background colour
vim.opt.termguicolors          = true                -- Enable 24 bit terminal colours
vim.opt.wildmode               = "longest,list"      -- Bash like tab completions
vim.opt.cc                     = "120"               -- 120 character column border
vim.opt.cursorline             = true                -- highlight current cursor line
vim.opt.ttyfast                = true                -- Faster screen scrolling
vim.opt.wrap                   = false               -- Disable line wrapping
vim.cmd("syntax on")                                 -- Enable syntax highlighting
vim.cmd("filetype plugin on")
vim.opt.clipboard:append({"unnamed", "unnamedplus"}) -- Use system clipboard

-- Indent behaviour
vim.opt.tabstop                = 4                   -- Set tabwidth to 4 spaces
vim.opt.softtabstop            = 4                   -- See multiple spaces as tabs so <BS> behaves itself
vim.opt.expandtab              = true                -- Expand tabs to spaces
vim.opt.shiftwidth             = 4                   -- Auto indent with
vim.opt.autoindent             = true                -- Set automatic indents
vim.cmd("filetype plugin indent on")                 -- Indentation enabled based on file type

-- Mouse behaviour
vim.opt.mouse                  = "v"                 -- Middle click mouse paste
vim.opt.mouse                  = "a"                 -- Enable mouse left click

-- Install and use Lazy for plugin management
require("config.lazy")
require("config.keymaps")
