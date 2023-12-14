local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in pairs(require("utils").servers) do
	Opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	server = vim.split(server, "@")[1]
	lspconfig[server].setup(Opts)
end
