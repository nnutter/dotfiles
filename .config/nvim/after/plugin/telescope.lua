local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope Git files' })
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = 'Telescope file search' })
