return {
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
		},
		keys = {
			{
				"<leader>-",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				"<leader>cw",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				"<c-up>",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		opts = {
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		},
		init = function()
			vim.g.loaded_netrwPlugin = 1
		end,
	},
	{
		'stevearc/oil.nvim',
		opts = {},
		dependencies = {
			{ "nvim-mini/mini.icons", opts = {} }
		},
		lazy = false,
	},
	-- {
	-- "nvim-neo-tree/neo-tree.nvim",
	-- dependencies = {
	-- 	"nvim-lua/plenary.nvim",
	-- 	"nvim-tree/nvim-web-devicons",
	-- 	"MunifTanjim/nui.nvim",
	-- 	{
	-- 		"folke/snacks.nvim",
	-- 		lazy = false,
	-- 	},
	-- },
	-- lazy = false,
	-- opts = {
	-- 	source_selector = {
	-- 		winbar = true,
	-- 		statusline = true
	-- 	},
	-- 	filesystem = {
	-- 		window = {
	-- 			mappings = {
	-- 				["o"] = "system_open",
	-- 			},
	-- 		},
	-- 		},
	-- 		commands = {
	-- 		system_open = function(state)
	-- 			local node = state.tree:get_node()
	-- 			local path = node:get_id()
	-- 			-- macOs: open file in default application in the background.
	-- 			vim.fn.jobstart({ "open", path }, { detach = true })
	-- 			-- Linux: open file in default application
	-- 			vim.fn.jobstart({ "xdg-open", path }, { detach = true })

	-- 		-- Windows: Without removing the file from the path, it opens in code.exe instead of explorer.exe
	-- 		local p
	-- 		local lastSlashIndex = path:match("^.+()\\[^\\]*$") -- Match the last slash and everything before it
	-- 		if lastSlashIndex then
	-- 		p = path:sub(1, lastSlashIndex - 1) -- Extract substring before the last slash
	-- 		else
	-- 		p = path -- If no slash found, return original path
	-- 			end
	-- 		vim.cmd("silent !start explorer " .. p)
	-- 		end,
	-- 		},
	-- 	}
	-- },
}



