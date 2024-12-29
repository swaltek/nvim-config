return{
  "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
  lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
  dependencies = {
    -- main one
    { "ms-jpq/coq_nvim", branch = "coq" },

    -- 9000+ Snippets
    { "ms-jpq/coq.artifacts", branch = "artifacts" },

    -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
    -- Need to **configure separately**
    -- { 'ms-jpq/coq.thirdparty', branch = "3p" }
    -- - shell repl
    -- - nvim lua api
    -- - scientific calculator
    -- - comment banner
    -- - etc
  },
  init = function()
    vim.g.coq_settings = {
		-- COQ settings here
		auto_start = true, -- if you want to start COQ at startup
		keymap = {
				recommended = false,
		},
		display = {
					statusline = {
						helo = false,
					}
		}
	}
	
	vim.api.nvim_set_keymap('i', '<BS>', [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true })
	vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-e><Tab>" : "\<Tab>"]], { expr = true, silent = true })
	vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
	--- vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })

	vim.api.nvim_set_keymap(
	  "i",
	  "<CR>",
	  [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
	  { expr = true, silent = true }
	)
  end,
  config = function()
    -- LSP settings here
	local lspconfig = require('lspconfig')
	lspconfig.gopls.setup({})
	lspconfig.emmet_language_server.setup({})

  end,
}
