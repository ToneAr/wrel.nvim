return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'franco-ruggeri/codecompanion-lualine.nvim'
		},
		config = function()
			local colors = {
				blue   = '#206528',
				cyan   = '#27778c',
				black  = '#080808',
				white  = '#c6c6c6',
				red    = '#a6174f',
				violet = '#88399e',
				grey   = '#303030',
				bg = '#355a4e',
			}
			require('lualine').setup({
				options = {
					icons_enabled = true,
					theme = {
						normal = {
							a = { fg = colors.white, bg = colors.bg },
							b = { fg = colors.white, bg = colors.bg },
							c = { fg = colors.white, bg = colors.bg },
							x = { fg = colors.white, bg = colors.bg },
							y = { fg = colors.white, bg = colors.bg, gui = 'bold' },
							z = { fg = colors.white, bg = colors.bg, gui = 'bold' },
						},
						insert = { z = { bg = colors.blue } },
						visual = { z = { bg = colors.cyan } },
						replace = {z = { bg = colors.red } },
						terminal = { z = { bg = colors.violet } },
						command = { z = { bg = colors.violet } },
						inactive = {
							a = { fg = colors.white, bg = colors.grey },
							b = { fg = colors.white, bg = colors.gray },
							c = { fg = colors.white, bg = colors.gray },
							x = { fg = colors.white, bg = colors.gray },
							y = { fg = colors.white, bg = colors.gray },
							z = { fg = colors.white, bg = colors.gray },
						},
					},
					-- use rounded bubble-type separators
					component_separators = "",
					section_separators = { left = '', right = '' },
				},
				sections = {
					lualine_a = {
						{
							'branch',
							icon = '',
							color = { fg = colors.white, gui = 'bold' }
						},
						'filename',
					},
					lualine_b = {
						{
							function()
								return "%="
							end,
						},
					},
					lualine_c = {
					},
					lualine_x = {
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							symbols = { error = " ", warn = " ", info = " " },
							diagnostics_color = {
								color_error = { fg = colors.red },
								color_warn = { fg = colors.yellow },
								color_info = { fg = colors.cyan },
							},
						},
						'codecompanion',
					},
					lualine_y = {
						'filetype',
					},
					lualine_z = {
						{
							'mode',
							separator = { right = '' },
							right_padding = 0,
							color = { fg = colors.white, gui = 'bold' },
						}
					},
				},
				inactive_sections = {
					lualine_a = { 'filename' },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { 'location' },
				},
				tabline = {},
				extensions = {}
			})
		end
	}
}
