local M = {}

M.format_visual_selection_with_black_formatter = function()
	local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
	vim.api.nvim_feedkeys(esc, "x", false)
	local filetype = vim.api.nvim_buf_get_option(0, "filetype")
	if filetype == "python" then
		local start_row = vim.api.nvim_buf_get_mark(0, "<")[1]
		local end_row = vim.api.nvim_buf_get_mark(0, ">")[1]
		local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
		local buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
		vim.api.nvim_buf_set_option(buf, "filetype", "python")
		vim.api.nvim_buf_call(buf, function()
			vim.cmd("silent :Black")
			print("Selected Lines Formatted Successfully.")
		end)
		local formatted_lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
		vim.api.nvim_buf_set_lines(0, start_row - 1, end_row, false, formatted_lines)
		vim.api.nvim_buf_delete(buf, {})
	end
end
return M
