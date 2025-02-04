-- Define general key maps that aren't covered in our packages
vim.g.mapleader = " "

local keymap = vim.keymap

local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- New Windows
map("n", "<leader>o", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Telescope keys
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope git commits<cr>", { desc = "Find todos" })

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
keymap.set("n", "<leader>dB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Breakpoint Condition" })
keymap.set("n", "<leader>db", function()
	dap.toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
keymap.set("n", "<leader>dc", function()
	dap.continue()
end, { desc = "Run/Continue" })
keymap.set("n", "<leader>da", function()
	dap.continue({ before = get_args })
end, { desc = "Run with Args" })
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
keymap.set("n", "<leader>dw", function()
	dap.ui.widgets.hover()
end, { desc = "Widgets" })
