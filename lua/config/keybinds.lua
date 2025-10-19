vim.g.leader = " "

-- Editor
vim.keymap.set({"n", "i", "v"},           -- Save file
	"<C-s>",
	function() vim.cmd("w") end,
	{ noremap = true, silent = true }
)
vim.keymap.set("n",                       -- Quit Buffer
	"<leader>q",
	function () vim.cmd("q") end
)
vim.keymap.set({"n", "i", "v"},           -- Quit Nvim
	"<C-q>",
	function() vim.cmd("qa") end,
	{ noremap = true, silent = true }
)
vim.keymap.set({"n", "i", "v"},           -- Force Quit Nvim
	"<M-q>",
	function () vim.cmd("qa!") end,
	{ noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>h",          -- Horizontal Split
	function() vim.cmd("split") end
)
vim.keymap.set("n", "<leader>l",          -- Vertical Split
	function() vim.cmd("vsplit") end
)
vim.keymap.set("n", "<leader><BS>",
	function() vim.cmd("noh") end
)
vim.keymap.set("n", "<leader>.",          -- Code Actions
	function() vim.lsp.buf.code_action() end
)

vim.keymap.set({ 'n', 't' },              -- Docker
	'<leader>ld',
	'<Cmd>lua LazyDocker.toggle()<CR>'
)


-- File Navigation
local tscopeBuiltin = require'telescope.builtin'
local telescope = require('telescope')
vim.keymap.set({"n", "i", "v"}, "<C-e>", tscopeBuiltin.find_files , { noremap = true, silent = true })
vim.keymap.set({"n", "i", "v"}, "<C-f>", tscopeBuiltin.live_grep , { noremap = true, silent = true })
vim.keymap.set({"n", "i", "v"}, "<C-o>", tscopeBuiltin.buffers , { noremap = true, silent = true })
vim.keymap.set({"n", "i", "v"}, "<C-t>", tscopeBuiltin.oldfiles, { noremap = true, silent = true })
vim.keymap.set({"n", "i", "v"}, "<C-h>", tscopeBuiltin.help_tags , { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", function() telescope.extensions.project.project{} end, { noremap = true, silent = true })

-- File Explorer
vim.keymap.set("n", "<C-M-B>", ":Oil<CR>")
local neotree = require"neo-tree.command"
vim.keymap.set("n", "<C-b>",
	function()
		neotree.execute({
			toggle = true,
			dir = vim.loop.cwd()
		})
	end,
	{ noremap = true, silent = true }
)


-- Copilot
-- local copilotChat = require("CopilotChat")
-- vim.keymap.set("n", "<C-i>", copilotChat.toggle)
vim.keymap.set("n", "<leader>i", ":CodeCompanionActions<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-i>", ":CodeCompanion<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-M-I>", ":CodeCompanionChat Toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-i>", ":'<,'>CodeCompanion<CR>", { noremap = true, silent = true })

-- Code Formatting
vim.keymap.set("n", "<leader>kf", ":Prettier<CR>", { remap = true, silent = true })
