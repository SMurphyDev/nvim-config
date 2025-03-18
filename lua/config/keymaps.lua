-- Define general key maps that aren't covered in our packages
vim.g.mapleader = " "

local keymap = vim.keymap

-- Save
keymap.set("n", "<leader>w", "<CMD>update<CR>", { silent = true, desc = "Save" })

-- Quit
keymap.set("n", "<leader>q", "<CMD>q<CR>", { silent = true, desc = "Quit" })

-- Exit insert mode
keymap.set("i", "jk", "<ESC>", { silent = true, desc = "Exit insert mode" })

-- New Windows
keymap.set("n", "<leader>o", "<CMD>vsplit<CR>", { silent = true, desc = "Vertical window split" })
keymap.set("n", "<leader>p", "<CMD>split<CR>", { silent = true, desc = "Horizontal window split" })

-- Window Navigation
keymap.set("n", "<C-h>", "<C-w>h", { silent = true, desc = "Move to left window" })
keymap.set("n", "<C-l>", "<C-w>l", { silent = true, desc = "Move to right window" })
keymap.set("n", "<C-k>", "<C-w>k", { silent = true, desc = "Move to window above" })
keymap.set("n", "<C-j>", "<C-w>j", { silent = true, desc = "Move to window below" })

-- Telescope keys
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "Find todos" })

-- Set keymap for conform code formatting
local conform = require("conform")
vim.keymap.set({ "n", "v" }, "<leader>f", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 3000,
	})
end, { desc = "Format file or range (in visual mode)" })

-- Dap debugger key maps
local dap = require("dap")
local dapui = require("dapui")
keymap.set("n", "<leader>dB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Breakpoint Condition" })
keymap.set("n", "<leader>db", function()
	dap.toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
keymap.set("n", "<leader>dc", function()
	dap.continue()
end, { desc = "Run/Continue" })
keymap.set("n", "<leader>dC", function()
	dap.run_to_cursor()
end, { desc = "Run to Cursor" })
keymap.set("n", "<leader>dg", function()
	dap.goto_()
end, { desc = "Go to Line (No Execute)" })
keymap.set("n", "<leader>di", function()
	dap.step_into()
end, { desc = "Step Into" })
keymap.set("n", "<leader>dj", function()
	dap.down()
end, { desc = "Down" })
keymap.set("n", "<leader>dk", function()
	dap.up()
end, { desc = "Up" })
keymap.set("n", "<leader>dl", function()
	dap.run_last()
end, { desc = "Run Last" })
keymap.set("n", "<leader>do", function()
	dap.step_out()
end, { desc = "Step Out" })
keymap.set("n", "<leader>dO", function()
	dap.step_over()
end, { desc = "Step Over" })
keymap.set("n", "<leader>dP", function()
	dap.pause()
end, { desc = "Pause" })
keymap.set("n", "<leader>dr", function()
	dap.repl.toggle()
end, { desc = "Toggle REPL" })
keymap.set("n", "<leader>ds", function()
	dap.session()
end, { desc = "Session" })
keymap.set("n", "<leader>dt", function()
	dap.terminate()
end, { desc = "Terminate" })
keymap.set("n", "<leader>du", function()
	dapui.toggle()
end, { desc = "Dap UI Toggle" })

-- Code completion key maps
local cmp = require("cmp")
keymap.set("i", "<C-d>", function()
	cmp.mapping.scroll_docs(-4)
end, { desc = "Scroll docs backwards" })
keymap.set("i", "<C-f>", function()
	cmp.mapping.scroll_docs(4)
end, { desc = "Scroll docs forewards" })
keymap.set("i", "<C-Space>", function()
	cmp.mapping.complete()
end, { desc = "Code complete" })
keymap.set("i", "<C-e>", function()
	cmp.mapping.close()
end, { desc = "Close completion" })
keymap.set("i", "<CR>", function()
	cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	})
end, { desc = "Select completion option" })

-- Toggle button for lazy git terminal
local terms = require("config.terms")
keymap.set("n", "<F6>", function()
	terms.toggle_lazygit()
end, { desc = "Toggle lazygit", noremap = true, silent = true })
