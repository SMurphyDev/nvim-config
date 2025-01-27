return {
    -- Generic package config for packages which require very little configuration.
    -- Place more complex configuration set ups in their on spec files.

    -- Configure a color scheme
    {
        "https://github.com/neanias/everforest-nvim.git",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme everforest")
        end
    },

    -- Set up oil file manager
    {
        "https://github.com/stevearc/oil.nvim.git",
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { "https://github.com/nvim-tree/nvim-web-devicons.git" },
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    },

    -- Smart pair matching for brackets, string, etc.
    {
        "https://github.com/windwp/nvim-autopairs.git",
        event = "InsertEnter",
        opts = {
            check_ts = true,
            disable_fileypes = {"TelescopePrompt", "vim"}
        },
    },

    -- Text colorizer and highlighting
    {
        "https://github.com/norcalli/nvim-colorizer.lua.git",
        opts = {"*"}
    },

    -- Nicer status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "https://github.com/nvim-tree/nvim-web-devicons.git" },
        opts = {} -- Empty opts ensures lualine.setup() is called without needing a config function
    },

    -- Fuzzy search for finding files by content
    {
        "https://github.com/nvim-telescope/telescope.nvim.git",
        tag = "0.1.6",
        dependencies = { "https://github.com/nvim-lua/plenary.nvim.git" },
        config = function()
            require("telescope").setup()

            -- set keymaps
            local keymap = vim.keymap

            keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
            keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find recent files" })
            keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string in cwd" })
            keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Find string under cursor in cwd" })
            keymap.set("n", "<leader>fc", "<cmd>Telescope git commits<cr>", { desc = "Find todos" })
        end,
    },

    -- For quickly popping and managing terminals
    {
        "https://github.com/akinsho/toggleterm.nvim.git",
        version = "*",
        opts = {
            size = 10,
            open_mapping = [[<F7>]],
            shading_factor = 2,
            direction = "horizontal",
            hide_numbers = true,
            autochdir = false,
            border = "curved"
        }
    },

    -- Search suggestions for the command bar_size
    {
        "https://github.com/gelguy/wilder.nvim.git",
        lazy = false,
        opts = {
            modes = {":", "/", "?"},
            next_key = "<Tab>",
            previous_key = "<S-Tab>",
            accept_key = "<Down>",
            reject_key = "<Up>"
        }
    }

}
