return {
	{
		"mason-org/mason.nvim",
		-- version = "1.11.0",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		}
	},
	{
		"mason-org/mason-lspconfig.nvim",
		-- version = "1.32.0",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {},
				automatic_installation = true,
			})
		end
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			"folke/lazydev.nvim"
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Enhance capabilities with semantic tokens support
			capabilities.textDocument = capabilities.textDocument or {}
			capabilities.textDocument.semanticTokens = {
				dynamicRegistration = true,
				tokenTypes = {
					"namespace", "type", "class", "enum", "interface",
					"struct", "typeParameter", "parameter", "variable", "property",
					"enumMember", "event", "function", "method", "macro", "keyword",
					"modifier", "comment", "string", "number", "regexp", "operator", "decorator"
				},
				tokenModifiers = {
					"Module", "Block", "With", "shadowed", "error", "unused"
				},
				formats = { "relative" },
				requests = {
					range = true,
					full = {
						delta = true
					}
				},
				multilineTokenSupport = true,
				overlappingTokenSupport = true,
				serverCancellationSupport = true,
				augmentsSyntaxTokens = true
			}

			local lspconfig = require("lspconfig")

			-- Standard servers
			local servers = { "ts_ls", "eslint" }

			-- Wolfram Language LSP setup
			local configs = require("lspconfig.configs")
			if not configs.wl_lsp then
				configs.wl_lsp = {
					default_config = {
						name = "wl_lsp",
						cmd = {
							"wolframscript",
							"-noinit",
							"-noprompt",
							"-nopaclet",
							"-noicon",
							"-nostartuppaclets",
							"-run",
							"'Needs[\"LSPServer`\"];LSPServer`StartServer[]'"
						},
						filetypes = { "wl", "wolfram" },
						root_dir = function(fname)
							-- Try multiple patterns to find project root
							local util = require("lspconfig.util")
							return util.root_pattern(
								-- Wolfram Language paclet
								"PacletInfo.wl",
								-- ".git",
								-- Any Wolfram Language files
								"*.wl", "*.wls", "*.wlt", "*.cdf",
								"*.nb", "*.tr", "*.m", "*.mt"
							)(fname) or vim.fs.dirname(fname)
						end,
						single_file_support = true,
					}
				}
			end

			-- Setup the Wolfram Language LSP with enhanced semantic tokens support
			lspconfig.wl_lsp.setup({
				capabilities = capabilities,
				flags = {
					debounce_text_changes = 150,
				},
				-- on_attach = function(client, bufnr)
				-- 	-- Ensure LSP starts when opening wolfram files in a project
				-- 	if client.name == "wl_lsp" then
				-- 		vim.notify("Wolfram Language LSP attached to buffer " .. bufnr, vim.log.levels.INFO)
				-- 	end
				-- end,
			})

			-- Setup all other servers
			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
				})
			end

			-- Special config for lua_ls
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						}
					}
				}
			})
		end
	}
}
