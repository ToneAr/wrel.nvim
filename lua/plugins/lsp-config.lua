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
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			-- Enhance capabilities with semantic tokens support
			capabilities.textDocument = capabilities.textDocument or {}
			capabilities.textDocument.semanticTokens = {
				dynamicRegistration = true,
				tokenTypes = {
					"namespace", "type", "class", "enum", "interface", "struct",
					"typeParameter", "parameter", "variable", "property", "enumMember",
					"event", "function", "method", "macro", "keyword", "modifier",
					"comment", "string", "number", "regexp", "operator", "decorator"
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
				require("mason-lspconfig").setup({
					automatic_installation = true,
					handlers = {
						function(name)
							vim.lsp.config[name] = {
								capabilities = capabilities,
							}
							vim.lsp.enable(name)
						end,
						['lua_ls'] = function()
							vim.lsp.config.lua_ls = {
								capabilities = capabilities,
								settings = {
									Lua = {
										diagnostics = {
											globals = { "vim" }
										}
									}
								}
							}
							vim.lsp.enable('lua_ls')
						end
					}
				})
				
				-- Set up global autocmd for Wolfram Language semantic highlighting
				vim.api.nvim_create_augroup("WolframSemanticTokens", { clear = true })
				
				-- Set Wolfram filetype for appropriate files
				vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
					group = "WolframSemanticTokens",
					pattern = {"*.wl", "*.wls", "*.m", "*.nb", "*.wlt", "*.tr", "*.mt", "*.cdf"},
					callback = function()
						vim.bo.filetype = "wolfram"
					end,
				})
				
				-- Ensure semantic tokens are enabled for Wolfram LSP
				vim.api.nvim_create_autocmd("LspAttach", {
					group = "WolframSemanticTokens",
					callback = function(args)
						local client = vim.lsp.get_client_by_id(args.data.client_id)
						if not client or client.name ~= "wl_lsp" then
							return
						end
						
						-- Ensure semantic tokens are properly configured
						client.server_capabilities.semanticTokensProvider = {
							full = true,
							legend = {
								tokenTypes = {
									"namespace", "type", "class", "enum", "interface",
									"struct", "typeParameter", "parameter", "variable",
									"property", "enumMember", "event", "function", "method",
									"macro", "keyword", "modifier", "comment", "string",
									"number", "regexp", "operator", "decorator"
								},
								tokenModifiers = {
									"Module", "Block", "With", "shadowed", "error", "unused",
									"declaration", "definition", "readonly", "static",
									"deprecated", "abstract", "async", "modification",
									"documentation", "defaultLibrary"
								}
							}
						}
						
						-- Refresh semantic tokens on buffer enter
						vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
							group = "WolframSemanticTokens",
							pattern = {"*.wl", "*.wls", "*.wlt", "*.m", "*.mt", "*.tr", "*.nb", "*.cdf"},
							callback = function()
								if vim.lsp.semantic_tokens and vim.lsp.semantic_tokens.force_refresh then
									vim.lsp.semantic_tokens.force_refresh()
								end
							end
						})
					end
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
}
