local status_ok, coq = pcall(require, "coq")
if not status_ok then
	vim.notify("coq not found")
	return
end

local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("lspconfig not found")
	return
end

lsp.gopls.setup(coq.lsp_ensure_capabilities())
lsp.pyright.setup(coq.lsp_ensure_capabilities())
