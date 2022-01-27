local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- =============================================================================
-- nvim-tree mappings
-- =============================================================================
keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)
keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', opts)
-- =============================================================================
-- telescope mappings
-- =============================================================================
keymap('n', '<leader>ff', ':Telescope find_files<CR>', opts)
keymap('n', '<leader>fs', ':Telescope live_grep<CR>', opts)
keymap('n', '<leader>fg', ':Telescope git_status<CR>', opts)
keymap('n', '<leader>f*', ':Telescope grep_string<CR>', opts)
keymap('n', '<leader>fl', ':Telescope lsp_references<CR>', opts)
keymap('n', '<leader>fb', ':Telescope buffers<CR>', opts)
keymap('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
-- =============================================================================
-- barbar mappings
-- =============================================================================
-- Move to previous/next
keymap('n', '<A-,>', ':BufferPrevious<CR>', opts)
keymap('n', '<A-.>', ':BufferNext<CR>', opts)
-- Re-order to previous/next
keymap('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', ':BufferMoveNext<CR>', opts)
-- Close buffer
keymap('n', '<A-c>', ':BufferClose<CR>', opts)
keymap('n', '<A-p>', ':BufferPick<CR>', opts)
-- Sort automatically by...
keymap('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
keymap('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
keymap('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)
keymap('n', '<Space>bw', ':BufferOrderByWindowNumber<CR>', opts)
-- =============================================================================
-- tagbar mappings
-- =============================================================================
keymap('n', '<F8>', ':TagbarToggle<CR>', opts)
-- =============================================================================
-- easymotion mappings
-- =============================================================================
local easymotionOpts = { silent = true }
keymap('n', 'f', '<Plug>(easymotion-overwin-f2)', easymotionOpts)
keymap('n', 'n', '<Plug>(incsearch-nohl-n)', easymotionOpts)
keymap('n', 'N', '<Plug>(incsearch-nohl-N)', easymotionOpts)
keymap('n', '*', '<Plug>(incsearch-nohl-*)', easymotionOpts)
keymap('n', '#', '<Plug>(incsearch-nohl-#)', easymotionOpts)
keymap('n', 'g*', '<Plug>(incsearch-nohl-g*)', easymotionOpts)
keymap('n', 'g#', '<Plug>(incsearch-nohl-g#)', easymotionOpts)
keymap('n', 'z/', '<Plug>(incsearch-easymotion-/)', easymotionOpts)
keymap('n', 'z?', '<Plug>(incsearch-easymotion-?)', easymotionOpts)
keymap('n', 'zg/', '<Plug>(incsearch-easymotion-stay)', easymotionOpts)

-- =============================================================================
-- floaterm mappings
-- =============================================================================
keymap('n', '<leader>tg', ':FloatermNew lazygit<CR>', opts)
-- =============================================================================
-- git mappings
-- =============================================================================
keymap('n', '<leader>gm', '<Plug>(git-messenger)', opts)
