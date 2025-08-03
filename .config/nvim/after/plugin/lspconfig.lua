local coq = require('coq')
local lsp = require("lspconfig")

lsp.gopls.setup(coq.lsp_ensure_capabilities())
lsp.pyright.setup(coq.lsp_ensure_capabilities())
