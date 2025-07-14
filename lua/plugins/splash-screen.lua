return {
	{
		"goolord/alpha-nvim",
		-- dependencies = { 'echasnovski/mini.icons' },
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			local startify = require("alpha.themes.startify")
			startify.file_icons.provider = "devicons"
			local dashboard = require("alpha.themes.dashboard")
			-- add today's date in the footer
			local today = os.date("%a, %b %d, %Y")
			dashboard.section.footer.opts = { position = "center", hl = "Comment" }
			dashboard.section.header.val = {
				today,
				[[╭───────────────────────────────────────────────────╮]],
				[[│    _       __ ___  ______ _           _           │]],
				[[│   | |     / / __ \/ ____/ /    _   __(_)___ ___   │]],
				[[│   | | /| / / /_/ / __/ / /    | | / / / __ `__ \  │]],
				[[│   | |/ |/ / _, _/ /___/ /____ | |/ / / | | | | |  │]],
				[[│   |__/|__/_/ |_/_____/_____(_)|___/_/__| |_| |_|  │]],
				[[│                                                   │]],
				[[╰───────────────────────────────────────────────────╯]],
			}
			dashboard.section.footer.val = {
				"Version: " .. vim.fn.system("cd ~/.config/nvim && git rev-parse --short HEAD"):gsub("\n", "")
			}
			dashboard.section.header.opts.hl = "ErrorMsg"
			dashboard.section.buttons.val = {
				dashboard.button( "n", "  New file" , ":ene <BAR> startinsert <CR>"),
				dashboard.button( "f", "󰈞  Find file" , ":Telescope find_files<CR>"),
				dashboard.button( "r", "󱋡  Recent files" , ":Telescope oldfiles<CR>"),
				dashboard.button( "p", "🗃 Recent projects", ":Telescope project<CR>"),
				dashboard.button( "h", "󰞋  Help pages" , ":Telescope help_tags<CR>"),
				dashboard.button( "q", "󰅚  Quit NVIM" , ":qa<CR>"),
			}
			require("alpha").setup(
				dashboard.config
			)
		end,
	},
	-- {
	-- 	"startup-nvim/startup.nvim",
	-- 	dependencies = {
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope-file-browser.nvim"
	-- 	},
	-- 	config = function()
	-- 		require "startup".setup({
	-- 			section_1 = {
	-- 				type = "text",
	-- 				align = "center",
	-- 				title = "Welcome to Neovim",
	-- 				margin = 5,
	-- 				content = {
	--
	-- 				},
	-- 				highlight = "Structure",
	-- 				default_color = "#61afef",
	-- 			},
	-- 			options = {
	-- 				mapping_keys = true,
	-- 				cursor_column = 0.5,
	-- 				empty_lines_between_mappings = true,
	-- 				disable_statusline = true,
	-- 				padding = {1,2}
	-- 			},
	-- 			mappings = {
	-- 				execute_command = "<CR>",
	-- 				open_file = "o",
	-- 				open_file_split = "<c-o>",
	-- 				open_section = "<TAB>",
	-- 				open_help = "?",
	-- 			},
	-- 			colors = {
	-- 				background = "#282c34",
	-- 				folded_section = "#3e4451",
	-- 			},
	-- 			parts = {
	-- 				"section_1",
	-- 			}
	-- 		})
	-- 	end
	-- }
}
