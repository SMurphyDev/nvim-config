return {
    -- configure automatic code formatting
    "https://github.com/stevearc/conform.nvim.git",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
         formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
                java = {"java-google-format"}
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            }
    },
    config = function()
        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            local conform = require("conform")
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end,
        {desc = "Format file or range (in visual mode)" })
    end,
}
