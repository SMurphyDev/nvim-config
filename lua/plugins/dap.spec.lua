return {
	{
		"https://github.com/mfussenegger/nvim-dap.git",
		recommended = true,
		desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

		dependencies = {
			-- Debugger UI
			{
				"https://github.com/rcarriga/nvim-dap-ui.git",
			},

			-- Virtual text for the debugger
			{
				"https://github.com/theHamsta/nvim-dap-virtual-text.git",
				opts = {},
			},

			-- Library for async io
			{
				"https://github.com/nvim-neotest/nvim-nio.git",
			},
		},
	},

	{
		"https://github.com/mfussenegger/nvim-dap-python.git",
		config = function()
			require("dap-python").setup("./venv/bin/python3")
		end,
	},
}
