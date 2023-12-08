local M = {}

function M.send_notify(message)
	local notify = require("notify")
	vim.cmd("SessionSave")
	notify(message, "INFO", {
		title = "Greeting",
		timeout = 3000,
	})
end

return M
