vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

local group = vim.api.nvim_create_augroup("Stylua", {})
vim.api.nvim_create_autocmd("bufWritePost", {
	pattern = "*.lua",
	callback = function()
		vim.cmd("silent :! stylua %")
	end,
	group = group,
})

local sql_formatter = vim.api.nvim_create_augroup("sql-formatter", {})
vim.api.nvim_create_autocmd("bufWritePost", {
	pattern = "*.sql",
	callback = function()
		vim.cmd("silent :!sql-formatter -c ~/.config/sql-formatter/config.json --fix %")
	end,
	group = sql_formatter,
})

local format_on_save_group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
vim.api.nvim_create_autocmd("bufWritePost", {
	pattern = { "*.c", "*.cpp" },
	callback = function()
		vim.lsp.buf.format()
	end,
	group = format_on_save_group,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.organizeImports" } }
		-- buf_request_sync defaults to a 1000ms timeout. Depending on your
		-- machine and codebase, you may want longer. Add an additional
		-- argument after params if you find that you have to write the file
		-- twice for changes to be saved.
		-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end
		vim.lsp.buf.format({ async = false })
	end,
})
