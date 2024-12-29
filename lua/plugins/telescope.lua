return {
  "nvim-telescope/telescope.nvim",
  dependecies = { "nvim-lua/plenary.nvim" },
  init = function()
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
	---vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
	vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
	---vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
	vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Telescope LSP symbols' })
	end,
}
