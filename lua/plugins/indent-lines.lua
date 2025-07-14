return {
	{ "lukas-reineke/virt-column.nvim",
		opts = {
			char = "│",
			virtcolumn = "+1,120",
			exclude = {
				filetypes = {
					"alpha", "oil", "markdown", "codecompanion"
				},
			}
		}
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "▎",
				tab_char = "▎",
			}
		},
		config = function (_, opts)
			require"ibl".setup(opts)
		end
	}
}
