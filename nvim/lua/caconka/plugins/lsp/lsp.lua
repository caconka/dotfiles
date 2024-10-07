return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		-- See :help lspconfig-global-defaults
		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")
		local lsp_defaults = lspconfig.util.default_config

		lsp_defaults.capabilities = vim.tbl_deep_extend(
			"force",
			lsp_defaults.capabilities,
			require("cmp_nvim_lsp").default_capabilities())

		---
		-- Diagnostic customization
		---
		local sign = function(opts)
			-- See :help sign_define()
			vim.fn.sign_define(opts.name, {
				texthl = opts.name,
				text = opts.text,
				numhl = ""
			})
		end

		sign({name = "DiagnosticSignError", text = "✘"})
		sign({name = "DiagnosticSignWarn", text = "▲"})
		sign({name = "DiagnosticSignHint", text = "⚑"})
		sign({name = "DiagnosticSignInfo", text = "»"})

		-- See :help vim.diagnostic.config()
		vim.diagnostic.config({
			virtual_text = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = "always",
			},
		})

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
			vim.lsp.handlers.hover,
			{ border = "rounded" })

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
			vim.lsp.handlers.signature_help,
			{ border = "rounded" })

		---
		-- LSP Keybindings
		---
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function()
				local keymap = vim.keymap.set
				local opts = {buffer = true, silent = true, noremap = true}

				-- You can search each function in the help page.
				-- For example :help vim.lsp.buf.hover()
				keymap("n", "K", vim.lsp.buf.hover, opts)
				keymap("n", "gd", vim.lsp.buf.definition, opts)
				keymap("n", "gD", vim.lsp.buf.declaration, opts)
				keymap("n", "gi", vim.lsp.buf.implementation, opts)
				keymap("n", "go", vim.lsp.buf.type_definition, opts)
				keymap("n", "gr", vim.lsp.buf.references, opts)
				keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				keymap("n", "<Leader>r", vim.lsp.buf.rename, opts)
				keymap({"n", "x"}, "<F3>", function()
					vim.lsp.buf.format { async = true }
				end, opts)
				keymap("n", "<Leader>e", vim.diagnostic.open_float, opts)
				keymap("n", "[d", vim.diagnostic.goto_prev, opts)
				keymap("n", "]d", vim.diagnostic.goto_next, opts)
				keymap({"n", "x"}, "<F4>", vim.lsp.buf.code_action, opts)
			end
		})


		---
		-- LSP servers
		---
		--
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		-- Prevent multiple instance of lsp servers
		-- if file is sourced again
		if vim.g.lsp_setup_ready == nil then
			vim.g.lsp_setup_ready = true

			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"html",
					"cssls",
					"ts_ls",
					"eslint",
					"astro",
					"jdtls",
					"gopls",
					"yamlls"
				},
				-- auto-install configured servers (with lspconfig)
				automatic_installation = true, -- not the same as ensure_installed
			})

			-- See :help lspconfig-setup
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
					}
				}
			})

			lspconfig["html"].setup({
				capabilities = capabilities,
			})

			lspconfig["cssls"].setup({
				capabilities = capabilities,
			})

			lspconfig["ts_ls"].setup({
				capabilities = capabilities,
				settings = {
					completions = {
						completeFunctionCalls = true
					}
				}
			})

			lspconfig["eslint"].setup({
				capabilities = capabilities,
			})

			lspconfig["astro"].setup({
				capabilities = capabilities,
			})

			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})

			lspconfig.yamlls.setup({
				capabilities = capabilities,
			})

			lspconfig.gopls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = {"gopls"},
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceHolders = true,
						analyses = {
							unusedparams = true
						}
					}
				}
			})
		end
	end,
}
