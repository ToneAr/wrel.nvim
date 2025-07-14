-- ToneWL Neovim Colorscheme
-- A port of the ToneWL VS Code theme
-- Author: GitHub Copilot (based on ToneWL by Tone)

local M = {}

-- Color palette
local colors = {
	-- Base UI colors
	bg = "none",
	-- bg = "#1E1D22",
	dark_bg = "#151515",
	lighter_bg = "#1F1E23",
	menu_bg = "#1E1D22",
	selection = "#262633",
	highlight = "#222035",
	fg = "#F2F7F8",
	fg_dark = "#CABECF",
	comment = "#706374",
	line_numbers = "#afaeaf",
	active_line_nr = "#ae83ef",

	-- Syntax colors
	black = "#000000",
	gray = "#AAAAAA",
	purple = "#cb58f8",
	bright_purple = "#be1ffd",
	teal = "#2ee2b5",
	cyan = "#8df7ff",
	pink = "#f14a98",
	yellow = "#fff1a0",
	soft_yellow = "#a5a47a",
	orange = "#ec633a",
	green = "#79DD6E",
	bright_green = "#5FD4AF",
	red = "#FF0000",
	error = "#F44747",
	warning = "#CD9731",
	info = "#6796E6",
	operator = "#99cc99",
	status = "#3B3442",
	tabline = "#302B36",
	tabline_fill = "#1F1E21",
	menu = "#29262F",
	menu_select = "#393344",

	wolfram = {
		module = "#4aa030",
		block = "#0f9d65",
		with = "#0a9d7a",
		shadowed = "#b33c1d",
		error = "#d01026",
		unused = "#777777",
		declaration = "#2ee2b5",
		type = "#F14A98",
		parameter = "#c0369a",
		parameter_shadowed = "#FF824F",
		parameter_error = "#d01026",
		parameter_unused = "#777777",
		type_error = "#706374"
	},

	-- Bracket colors
	bracket1 = "#5fd4a3",
	bracket2 = "#6fc7d3",
	bracket3 = "#6e95dd",
	bracket4 = "#8381f1",
	bracket5 = "#8c5fd4",
	bracket6 = "#cb6edd",

	-- Other
	border = "#6A6385",
	indent_guide = "#3f3c44",
	active_indent = "#ffffff",
	find_match = "#6449d2",
	find_highlight = "#5338be",
}

-- Terminal colors
local terminal_colors = {
	black = "#333333",
	bright_black = "#666666",
	red = "#C4265E",
	bright_red = colors.purple,
	green = "#79DD6E",
	bright_green = "#5FD4AF",
	yellow = "#B3B42B",
	bright_yellow = "#E2E22E",
	blue = "#6C7EC8",
	bright_blue = "#819AFF",
	magenta = "#8C6BC8",
	bright_magenta = "#b888e6",
	cyan = "#49ADBC",
	bright_cyan = "#69BBFD",
	white = "#E3E3DD",
	bright_white = "#F8F8F2",
}

-- Define highlight groups
local highlights = {
	-- UI elements
	Normal = { fg = colors.fg, bg = colors.bg },
	NormalFloat = { fg = colors.fg, bg = colors.menu_bg },
	ColorColumn = { bg = colors.gray },
	Cursor = { fg = colors.bg, bg = colors.fg },
	CursorColumn = { bg = colors.gray },
	CursorLine = { bg = colors.highlight },
	CursorLineNr = { fg = colors.active_line_nr },
	LineNr = { fg = colors.active_line_nr },
	LineNrAbove = { fg = colors.line_numbers },
	LineNrBelow = { fg = colors.line_numbers },
	LineColumn = { bg = colors.menu_bg },
	SignColumn = { bg = colors.bg },
	VertSplit = { fg = colors.border },
	VertiColumn = { fg = colors.red },
	Folded = { fg = colors.comment, bg = colors.selection },
	FoldColumn = { fg = colors.border, bg = colors.tabline },
	MatchParen = { fg = colors.cyan, bold = true },
	RenderMarkdownCode = { link = 'MarkdownCodeBlock' },
	MarkdownCodeBlock = { bg = colors.dark_bg },
	-- Search
	IncSearch = { bg = colors.find_match, fg = colors.fg },
	Search = { bg = colors.find_highlight, fg = colors.fg },
	-- Tabs and statusline
	StatusLine = { fg = colors.fg, bg = colors.status },
	StatusLineNC = { fg = colors.comment, bg = colors.status },
	TabLine = { fg = colors.fg_dark, bg = colors.tabline },
	TabLineFill = { bg = colors.tabline_fill },
	TabLineSel = { fg = colors.fg, bg = colors.bg },
	Title = { fg = colors.teal },
	Visual = { bg = colors.selection },
	VisualNOS = { bg = colors.selection },
	-- Messages
	ErrorMsg = { fg = colors.error },
	WarningMsg = { fg = colors.warning },
	MoreMsg = { fg = colors.info },
	Question = { fg = colors.teal },
	-- Popup menus
	Pmenu = { fg = colors.fg, bg = colors.menu },
	PmenuSel = { fg = colors.fg, bg = colors.menu_select },
	PmenuSbar = { bg = colors.status },
	PmenuThumb = { bg = colors.border },
	-- DiagnosticWarn
	DiagnosticError = { fg = colors.error },
	DiagnosticWarn = { fg = colors.warning },
	DiagnosticInfo = { fg = colors.info },
	DiagnosticHint = { fg = colors.border },
	-- Syntax groups
	Comment = { fg = colors.comment, italic = true },
	Constant = { fg = terminal_colors.bright_magenta },
	String = { fg = colors.yellow },
	Character = { fg = terminal_colors.bright_magenta },
	Number = { fg = terminal_colors.bright_magenta },
	Boolean = { fg = terminal_colors.bright_magenta },
	Float = { fg = terminal_colors.bright_magenta },

	Identifier = { fg = colors.fg },
	Function = { fg = colors.cyan },

	Statement = { fg = colors.purple },
	Conditional = { fg = colors.purple },
	Repeat = { fg = colors.purple },
	Label = { fg = colors.purple },
	Operator = { fg = colors.operator },
	Keyword = { fg = colors.purple },
	Exception = { fg = colors.purple },

	PreProc = { fg = colors.purple },
	Include = { fg = colors.purple },
	Define = { fg = colors.purple },
	Macro = { fg = colors.purple },
	PreCondit = { fg = colors.purple },

	Type = { fg = colors.cyan, italic = true },
	StorageClass = { fg = colors.cyan, italic = true },
	Structure = { fg = colors.teal },
	Typedef = { fg = colors.cyan, italic = true },

	Special = { fg = colors.active_line_nr },
	SpecialChar = { fg = colors.bright_purple },
	Tag = { fg = colors.purple },
	Delimiter = { fg = colors.fg },
	SpecialComment = { fg = colors.comment, italic = true },
	Debug = { fg = colors.error },

	Underlined = { underline = true },
	Ignore = { fg = colors.comment },
	Error = { fg = colors.error },
	Todo = { fg = colors.bright_yellow, bg = colors.bg, bold = true },

	IblIndentActive = { fg = colors.teal },
	Parameter = { fg = colors.pink },
	NotifyBackground = { bg = colors.black },

	RenderMarkdownH1Bg = { bg = "#352370", fg = "#785090" },
	RenderMarkdownH2Bg = { bg = "#282070", fg = "#635595" },
	RenderMarkdownH3Bg = { bg = "#203350", fg = "#586898" },
	RenderMarkdownH4Bg = { bg = "#103330", fg = "#487898" },
	RenderMarkdownH5Bg = { bg = "none", fg = "#387898" },
	RenderMarkdownH6Bg = { bg = "none", fg = "#195979" },

	-- TreeSitter
	["@parameter"] = { fg = colors.bright_purple, italic = true },
	["@function"] = { fg = colors.teal },
	["@method"] = { fg = colors.teal },
	["@keyword"] = { fg = colors.purple },
	["@keyword.function"] = { fg = colors.purple },
	["@keyword.operator"] = { fg = colors.purple },
	["@operator"] = { fg = colors.operator },
	["@property"] = { fg = colors.teal },
	["@field"] = { fg = colors.fg },
	["@variable"] = { fg = colors.fg },
	["@variable.builtin"] = { fg = colors.bright_purple },
	["@type"] = { fg = colors.cyan, italic = true },
	["@type.builtin"] = { fg = colors.cyan, italic = true },
	["@class"] = { fg = colors.teal, underline = true },
	["@constructor"] = { fg = colors.teal },
	["@namespace"] = { fg = colors.teal },
	["@string"] = { fg = colors.yellow },
	["@string.escape"] = { fg = colors.bright_purple },
	["@number"] = { fg = terminal_colors.bright_magenta },
	["@boolean"] = { fg = terminal_colors.bright_magenta },
	["@constant"] = { fg = terminal_colors.bright_magenta },
	["@constant.builtin"] = { fg = terminal_colors.bright_magenta },
	["@tag"] = { fg = colors.purple },
	["@tag.attribute"] = { fg = colors.teal },
	["@comment"] = { fg = colors.comment, italic = true },

	-- Generic LSP semantic tokens (language-agnostic)
	["@lsp.type.namespace"] = { fg = colors.teal },
	["@lsp.type.type"] = { fg = colors.cyan, italic = true },
	["@lsp.type.class"] = { fg = colors.teal, underline = true },
	["@lsp.type.enum"] = { fg = colors.cyan, italic = true },
	["@lsp.type.interface"] = { fg = colors.cyan, italic = true },
	["@lsp.type.struct"] = { fg = colors.cyan, italic = true },
	["@lsp.type.parameter"] = { fg = colors.bright_purple, italic = true },
	["@lsp.type.variable"] = { fg = colors.fg },
	["@lsp.type.property"] = { fg = colors.teal },
	["@lsp.type.enumMember"] = { fg = terminal_colors.bright_magenta },
	["@lsp.type.function"] = { fg = colors.teal },
	["@lsp.type.method"] = { fg = colors.teal },
	["@lsp.type.macro"] = { fg = colors.purple },
	["@lsp.type.keyword"] = { fg = colors.purple },
	["@lsp.type.comment"] = { fg = colors.comment, italic = true },
	["@lsp.type.string"] = { fg = colors.yellow },
	["@lsp.type.number"] = { fg = terminal_colors.bright_magenta },
	["@lsp.type.regexp"] = { fg = colors.bright_purple },
	["@lsp.type.operator"] = { fg = colors.operator },
	["@lsp.type.decorator"] = { fg = colors.bright_purple },

	-- Generic LSP modifiers (language-agnostic)
	["@lsp.mod.deprecated"] = { strikethrough = true },
	["@lsp.mod.readonly"] = { italic = true },
	["@lsp.mod.modification"] = { bold = true },
	["@lsp.mod.documentation"] = { fg = colors.comment, italic = true },

	-- Rainbow Brackets
	["@rainbow.bracket.level1"] = { fg = colors.bracket1 },
	["@rainbow.bracket.level2"] = { fg = colors.bracket2 },
	["@rainbow.bracket.level3"] = { fg = colors.bracket3 },
	["@rainbow.bracket.level4"] = { fg = colors.bracket4 },
	["@rainbow.bracket.level5"] = { fg = colors.bracket5 },
	["@rainbow.bracket.level6"] = { fg = colors.bracket6 },

	-- LSP Syntax Highlights
	["@lsp.mod.Module.wolfram"] = { fg = colors.wolfram.module },
	["@lsp.mod.Block.wolfram"] = { fg = colors.wolfram.block },
	["@lsp.mod.With.wolfram"] = { fg = colors.wolfram.with },
	["@lsp.mod.shadowed.wolfram"] = { fg = colors.wolfram.shadowed },
	["@lsp.mod.error.wolfram"] = { fg = colors.wolfram.error },
	["@lsp.mod.unused.wolfram"] = { fg = colors.wolfram.unused, italic = true },
	["@lsp.mod.declaration.wolfram"] = { fg = colors.wolfram.declaration, italic = true },
	["@lsp.type.type.wolfram"] = { fg = colors.wolfram.type, italic = true },
	["@lsp.type.parameter.wolfram"] = { fg = colors.wolfram.parameter, italic = true },
	["@lsp.type.parameter.shadowed.wolfram"] = { fg = colors.wolfram.parameter_shadowed, italic = true },
	["@lsp.type.parameter.error.wolfram"] = { fg = colors.wolfram.parameter_error },
	["@lsp.type.parameter.unused.wolfram"] = { fg = colors.wolfram.parameter_unused, italic = true },
	["@lsp.typemod.type.error.wolfram"] = { fg = colors.wolfram.type_error, italic = true},
}

function M.setup(opts)
	opts = opts or {}

	-- Set colorscheme name
	vim.g.colors_name = "tonewl"

	-- Set WL filetype on appropriate files
	vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
		pattern = {"*.wl", "*.wls", "*.m", "*.nb", "*.wlt", "*.tr", "*.mt", "*.cdf"},
		callback = function()
			vim.bo.filetype = "wolfram"
		end,
	})

	-- Set up semantic tokens when LSP attaches
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if not client then
				return
			end

			-- Only configure specific semantic tokens for Wolfram Language
			if client.name == "wl_lsp" then
				-- Always ensure semantic tokens capability is set up for WL
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

				-- Make sure semantic tokens are refreshed for WL files
				vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
					pattern = {"*.wl", "*.wls", "*.wlt", "*.m", "*.mt", "*.tr", "*.nb", "*.cdf"},
					callback = function()
						if vim.lsp.semantic_tokens and vim.lsp.semantic_tokens.force_refresh then
							vim.lsp.semantic_tokens.force_refresh()
						end
					end
				})
			end

			-- For all language servers, refresh semantic tokens when available
			if vim.lsp.semantic_tokens and vim.lsp.semantic_tokens.force_refresh then
				vim.lsp.semantic_tokens.force_refresh()
			end
		end
	})

	-- Set terminal colors
	vim.g.terminal_color_0 = terminal_colors.black
	vim.g.terminal_color_1 = terminal_colors.red
	vim.g.terminal_color_2 = terminal_colors.green
	vim.g.terminal_color_3 = terminal_colors.yellow
	vim.g.terminal_color_4 = terminal_colors.blue
	vim.g.terminal_color_5 = terminal_colors.magenta
	vim.g.terminal_color_6 = terminal_colors.cyan
	vim.g.terminal_color_7 = terminal_colors.white
	vim.g.terminal_color_8 = terminal_colors.bright_black
	vim.g.terminal_color_9 = terminal_colors.bright_red
	vim.g.terminal_color_10 = terminal_colors.bright_green
	vim.g.terminal_color_11 = terminal_colors.bright_yellow
	vim.g.terminal_color_12 = terminal_colors.bright_blue
	vim.g.terminal_color_13 = terminal_colors.bright_magenta
	vim.g.terminal_color_14 = terminal_colors.bright_cyan
	vim.g.terminal_color_15 = terminal_colors.bright_white

	-- Apply highlight groups
	for g, o in pairs(highlights) do
		vim.api.nvim_set_hl(0, g, o)
	end
end

return M

