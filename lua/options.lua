local options = {
	compatible = false,

	hlsearch = true,
	incsearch = true,
	smartcase = true,
	ignorecase = true,

	wrap = false,
	smarttab = true,
	autoread = true,
	autoindent = true,
	cursorline = true,

	number = true,
	expandtab = true,
	relativenumber = true,
	tabstop = 2,
	shiftwidth = 2,
	softtabstop = 2,
	showtabline = 2,
	regexpengine = 0,

	termguicolors = true,
	encoding = "UTF-8",
	completeopt = "menu,menuone,preview,noinsert,noselect",
}

for k, v in pairs(options) do
	vim.o[k] = v
end

vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.cmd("colorscheme everforest")

-- =============================================================================
-- python host
-- =============================================================================
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_prog = "/usr/bin/python3"
-- =============================================================================
-- floatterm mappings
-- =============================================================================
vim.g.floaterm_keymap_new = "<Leader>tn"
vim.g.floaterm_keymap_prev = "<Leader>tp"
vim.g.floaterm_keymap_next = "<Leader>tP"
vim.g.floaterm_keymap_hide = "<Leader>th"
vim.g.floaterm_keymap_kill = "<Leader>tk"
vim.g.floaterm_keymap_toggle = "<Leader>tt"
-- =============================================================================
-- easymotion mappings
-- =============================================================================
vim.g["incsearch#auto_nohlsearch"] = 1
