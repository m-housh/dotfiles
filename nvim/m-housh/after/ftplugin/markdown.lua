-- Markdown specific key maps.
--
local todos = require("todo-comments")
local keywords = { "WARN", "WARNING", "IMPORTANT" }

-- Show all the warnings in the quick fix list.
vim.keymap.set(
	"n",
	"<leader>tw",
	"<CMD>Trouble todo toggle filter = {tag = {WARN, IMPORTANT}}<CR>",
	{ desc = "[T]odo [W]arnings" }
)

vim.keymap.set("n", "]w", function()
	todos.jump_next({ keywords = keywords })
end, { desc = "Next [W]arning" })

vim.keymap.set("n", "[w", function()
	todos.jump_prev({ keywords = keywords })
end, { desc = "Previous [W]arning" })
