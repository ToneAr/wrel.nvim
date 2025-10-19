return {
	-- {
	-- 	"OXY2DEV/markview.nvim",
	-- 	lazy = false,
	-- 	priority = 49,
	-- 	dependencies = {
	-- 		"saghen/blink.cmp"
	-- 	},
	-- },
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
		ft = { "markdown", "codecompanion" },
		opts = {
			render_modes = {"n"},
			pipe_table = { preset = 'round' },
			sign = {
				enabled = true,
			},
			heading = {
				icons = { ' ', '> ', '>> ', '>>> ', '>>>> ', '>>>>> ' },
				signs = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
				-- border = true,
				border_virtual = true,
			},
			code = {
				language_border = ' ',
				language_left = '',
				language_right = '',
				language_pad = 0,
				width = 'block',
				right_pad = 2,
				left_pad = 0
			}
		},
	},
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	-- 	build = "cd app && yarn install",
	-- 	init = function()
	-- 		vim.g.mkdp_filetypes = { "markdown" }
	-- 	end,
	-- 	ft = { "markdown" },
	-- }
};
