require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "pyright", "gopls", "lua_ls" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- require("lspconfig").pylsp.setup {
--     capabilities = capabilities,
-- }
require("lspconfig").pyright.setup({
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
require("lspconfig").html.setup({
	capabilities = capabilities,
})

require("lspconfig").gopls.setup({
	capabilities = capabilities,
})

require("lspconfig").emmet_language_server.setup({
	capabilities = capabilities,
})

require("lspconfig").zls.setup({
	capabilities = capabilities,
})

require("lspconfig").rust_analyzer.setup({
	capabilities = capabilities,
})

require("lspconfig").clangd.setup({
	capabilities = capabilities,
})

require("lspconfig").cssls.setup({
	capabilities = capabilities,
})

require("lspconfig").lua_ls.setup({
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
require("lspconfig").tsserver.setup({
	capabilities = capabilities,
})
require("lspconfig").tailwindcss.setup({
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
