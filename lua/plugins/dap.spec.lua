return {
	{
		"https://github.com/mfussenegger/nvim-dap.git",
		recommended = true,
		desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

		dependencies = {
			-- Debugger UI
			{
				"https://github.com/rcarriga/nvim-dap-ui.git",
				opts = {
					enabled = true,
				},
			},

			-- Virtual text for the debugger
			{
				"https://github.com/theHamsta/nvim-dap-virtual-text.git",
				opts = {
					enabled = true,
					enabled_commands = true,
					highlight_changed_variables = true,
					highlight_new_as_changed = false,
					show_stop_reason = true,
					commented = false,
					only_first_definition = true,
					all_references = false,
					clear_on_continue = false,

					--- A callback that determines how a variable is displayed or whether it should be omitted
					--- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
					--- @param buf number
					--- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
					--- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
					--- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
					--- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
					display_callback = function(variable, buf, stackframe, node, options)
						-- by default, strip out new line characters
						if options.virt_text_pos == "inline" then
							return " = " .. variable.value:gsub("%s+", " ")
						else
							return variable.name .. " = " .. variable.value:gsub("%s+", " ")
						end
					end,
					-- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
					virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",
				},
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
			-- python adapter using venv
			require("dap").adapters.python = {
				type = "executable",
				command = "./venv/bin/python3",
				args = { "-m", "debugpy.adapter" },
			}
			-- Configuration for running pytest
			require("dap").configurations.python = {
				{
					name = "Launch file",
					type = "python",
					request = "launch",
					program = "${file}",
					pythonPath = function()
						return "./venv/bin/python3"
					end,
				},

				{
					name = "Pytest: Current File",
					type = "python",
					request = "launch",
					module = "pytest",
					args = {
						"${file}",
						"-sv",
						"--log-cli-level=INFO",
						"--log-file=test_out.log",
					},
					console = "integratedTerminal",
				},
			}
		end,
	},
}
