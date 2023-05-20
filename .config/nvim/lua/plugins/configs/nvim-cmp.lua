local status_ok, cmp = pcall(require, "cmp")

if not status_ok then
	return
end

local icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "ﰠ",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "塞",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local aliases = {
	nvim_lsp = "lsp",
	luasnip = "snippet",
}

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-e>"] = cmp.config.disable,
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<tab>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	window = {
		-- completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp", max_item_count = 10 },
		{ name = "luasnip", max_item_count = 10 },
		{ name = "path", max_item_count = 10 },
		{ name = "buffer", max_item_count = 10 },
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, item)
			-- Kind icons
			item.kind = string.format("%s %s", icons[item.kind], item.kind)
			-- Source
			item.menu = string.format("[%s]", aliases[entry.source.name] or entry.source.name)
			return item
		end,
	},
})

