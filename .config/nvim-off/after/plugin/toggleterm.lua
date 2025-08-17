local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	vim.notify("toggleterm not found")
	return
end

require("toggleterm").setup{
	open_mapping = [[<c-`>]],
	shade_terminals = false,
}

function _G.set_terminal_keymaps()
	local opts = {buffer = 0}
	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', '<C-w>h', [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set('t', '<C-w>j', [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set('t', '<C-w>k', [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set('t', '<C-w>l', [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set('t', '<C-w>v', vim.cmd.TermNew, opts)
	vim.keymap.set('t', '<C-w>w', [[<Cmd>wincmd w<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal  = require('toggleterm.terminal').Terminal
local claude = Terminal:new({ cmd = "claude" })

function _claude_toggle()
	claude:toggle()
end

vim.keymap.set('n', '<C-t>t', vim.cmd.TermNew)
vim.api.nvim_set_keymap("n", "<C-t>c", "<cmd>lua _claude_toggle()<CR>", {noremap = true, silent = true})
