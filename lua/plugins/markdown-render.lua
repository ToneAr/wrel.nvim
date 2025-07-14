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
			render_modes = true,
			sign = {
				enabled = true,
			},
			heading = {
				icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
				-- border = true,
				border_virtual = true,
			},
			code = {
				language_pad = 1
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
