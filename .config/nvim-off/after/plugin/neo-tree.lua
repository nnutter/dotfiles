local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
	vim.notify("neo-tree not found")
	return
end

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

neotree.setup({})

-- Simple keymap
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
