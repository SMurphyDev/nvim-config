 return {
     -- Plugins for manging code completion leveraging our lsp.
    "https://github.com/hrsh7th/nvim-cmp.git",
    event = "InsertEnter",
    dependencies = {
        "https://github.com/hrsh7th/cmp-buffer.git", -- source for text in buffer
        "https://github.com/hrsh7th/cmp-path.git", -- source for file system paths
        {
            "https://github.com/L3MON4D3/LuaSnip.git",
             version = "v2.*",
             -- install jsregexp (optional!).
            build = "make install_jsregexp",
        },
        "https://github.com/rafamadriz/friendly-snippets.git",
        "https://github.com/onsails/lspkind.nvim.git", -- vs-code like pictograms
    },

    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.close(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
        })

        vim.cmd([[
            set completeopt=menuone,noinsert,noselect
            highlight! default link CmpItemKind CmpItemMenuDefault
        ]])
    end,
}
