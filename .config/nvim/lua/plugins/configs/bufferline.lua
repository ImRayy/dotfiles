local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end
bufferline.setup({
	options = {
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
	},
})

-- local status_ok, bufferline = pcall(require, "bufferline")
-- if not status_ok then
-- 	return
-- end
--
-- bufferline.setup({
-- 	options = {
-- 		offsets = {
-- 			{ filetype = "NvimTree", text = "", padding = 1 },
-- 			{ filetype = "neo-tree", text = "", padding = 1 },
-- 			{ filetype = "Outline", text = "", padding = 1 },
-- 		},
--
-- 		text = "File Explorer",
-- 		highlight = "Directory",
-- 		text_align = "center",
-- 		diagnostics = "nvim_lsp",
-- 	},
-- })
