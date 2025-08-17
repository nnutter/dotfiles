vim.g.mapleader = " "

vim.g.coq_settings = {
	auto_start = 'shut-up',
	completion = {
		always = false,
	},
}

require("nnutter.lsp")
require("nnutter.packer")
require("nnutter.remap")
require("nnutter.set")
require("nnutter.tree-sitter")
