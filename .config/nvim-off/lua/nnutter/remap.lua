vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "<D-s>", function() vim.api.nvim_command('write') end)
vim.keymap.set("n", "<D-s>", function() vim.api.nvim_command('write') end)
