local A = vim.api
local B = vim.b
local G = vim.g

-- Format cmds of conform.nvim
A.nvim_create_user_command("FormatOnSaveDisable", function(args)
	if args.bang then
		B.disable_autoformat = true
	else
		G.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

A.nvim_create_user_command("FormatOnSaveEnable", function()
	B.disable_autoformat = false
	G.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})
