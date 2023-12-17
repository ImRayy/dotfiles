local M = {}

-- Key-mapping handler
function M.map(m, k, v, opts)
	vim.keymap.set(m, k, v, vim.tbl_deep_extend("force", { silent = true, noremap = true }, opts or {}))
end

-- Send notification
function M.send_notify(message)
	local notify = require("notify")
	vim.cmd("SessionSave")
	notify(message, "INFO", {
		title = "Greeting",
		timeout = 3000,
	})
end

return M
