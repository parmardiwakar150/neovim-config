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
			vim.cmd("%!black -q -")
			print("Selected Lines Formatted Successfully.")
		end)
		local formatted_lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
		vim.api.nvim_buf_set_lines(0, start_row - 1, end_row, false, formatted_lines)
		vim.api.nvim_buf_delete(buf, {})
	end
end

M.list_modified_buffers = function()
	local all_buffers = vim.api.nvim_list_bufs()
	local modified_buffers = {}
	for _, bufnr in ipairs(all_buffers) do
		local is_modified = vim.api.nvim_buf_get_option(bufnr, "modified")
		if is_modified then
			local file = vim.api.nvim_buf_get_name(bufnr)
			table.insert(modified_buffers, file)
		end
	end
	return modified_buffers
end
M.compare_to_clipboard = function()
	local filetype = vim.api.nvim_buf_get_option(0, "filetype")
	vim.cmd("vnew")
	vim.cmd('normal! "0p')
	vim.cmd("setlocal buftype=nowrite bufhidden=wipe nobuflisted")
	vim.cmd("set filetype=" .. filetype)
	vim.cmd("windo diffthis")
end

M.get_float_win_width = function()
	local width_ratio = 0.8
	local columns = vim.o.columns
	if columns < 130 then
		width_ratio = 0.9
	elseif columns > 150 and columns < 200 then
		width_ratio = 0.75
	end
	return math.floor(vim.o.columns * width_ratio)
end

M.get_float_win_height = function()
	local height_ratio = 0.8
	local lines = vim.o.lines
	if lines < 40 then
		height_ratio = 0.9
	end
	return math.floor(vim.o.lines * height_ratio)
end

M.generate_password = function()
	local buf = vim.api.nvim_create_buf(false, true)
	local cmd =
		"r !python3 -c \"import secrets, string; print(''.join(secrets.choice(string.ascii_letters + string.digits) for _ in range(8)))\""
	vim.api.nvim_buf_call(buf, function()
		vim.cmd(cmd)
		vim.cmd('normal "+yiw')
		local password = vim.fn.getreg("+")
		print("Password " .. password)
	end)
	vim.api.nvim_buf_delete(buf, {})
end

vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config({
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	})
end, { desc = "toggle diagnostic" })

return M
