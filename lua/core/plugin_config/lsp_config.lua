require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "pyright", "gopls", "lua_ls" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- require("lspconfig").pylsp.setup {
--     capabilities = capabilities,
-- }
vim.lsp.config("pyright", {
	-- capabilities = (function()
	--     local capabilities = vim.lsp.protocol.make_client_capabilities()
	--     capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
	--     return capabilities
	-- end)(),
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				useLibraryCodeForTypes = true,
				diagnosticSeverityOverrides = {
					reportUnusedVariable = "warning", -- or anything
				},
				typeCheckingMode = "off",
			},
		},
	},
})
vim.lsp.config("html", {
	capabilities = capabilities,
})

vim.lsp.config("gopls", {
	capabilities = capabilities,
})

vim.lsp.config("emmet_language_server", {
	capabilities = capabilities,
})

vim.lsp.config("zls", {
	capabilities = capabilities,
})

vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,
})

vim.lsp.config("clangd", {
	capabilities = capabilities,
})

vim.lsp.config("cssls", {
	capabilities = capabilities,
})

vim.lsp.config("dockerls", {
	capabilities = capabilities,
})

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "Lua 5.1",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {
					"vim",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
vim.lsp.config("ts_ls", {
	capabilities = capabilities,
})
vim.lsp.config("tailwindcss", {
	capabilities = capabilities,
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd('LspAttach', {
--     group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--     callback = function(ev)
--         -- Enable completion triggered by <c-x><c-o>
--         vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--         -- Buffer local mappings.
--         -- See `:help vim.lsp.*` for documentation on any of the below functions
--         local opts = { buffer = ev.buf }
--         vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--         vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--         vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--         vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--         vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--         vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--         vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--         vim.keymap.set('n', '<space>wl', function()
--             print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--         end, opts)
--         vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--         vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
--         vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
--         vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--         vim.keymap.set('n', '<space>f', function()
--             vim.lsp.buf.format { async = true }
--         end, opts)
--     end,
-- })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
