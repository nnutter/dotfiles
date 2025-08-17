local status_ok, telescope = pcall(require, "telescope.builtin")
if not status_ok then
	vim.notify("telescope not found")
	return
end

vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<D-p>', function()
  local is_git = os.execute('git rev-parse --is-inside-work-tree 2>/dev/null') == 0
  if is_git then
    telescope.git_files()
  else
    telescope.find_files()
  end
end, { desc = 'Telescope Git files' })

vim.keymap.set('n', '<leader>fs', function()
	telescope.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = 'Telescope file search' })
