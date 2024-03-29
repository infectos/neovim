local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Insert -> sign
map('i', '>>', '->', opts)
-- Insert => sign
map('i', '>.', '=>', opts)

map('i', 'jj', '<ESC>', opts)

-- Double ';' puts semicolon in the end of line
map('i', ';;', '<ESC>mxi<END>;<ESC>`xa', opts)
map('n', ';;', 'mxi<END>;<ESC>`x', opts)

-- Double ',' puts comma in the end of line
map('i', ',,', '<ESC>mxi<END>,<ESC>`xa', opts)
map('n', ',,', 'mxi<END>,<ESC>`x', opts)

-- Uppercase current word
map('i', '<C-u>', '<ESC>mxviwU`xa', opts)
map('i', '<C-d>', '<ESC>mxviwu`xa', opts)

-- Remaps for window navigation
map('n', '<leader>h', '<C-w>h', opts)
map('n', '<leader>j', '<C-w>j', opts)
map('n', '<leader>k', '<C-w>k', opts)
map('n', '<leader>l', '<C-w>l', opts)

map('n', '<leader>=', ':vertical resize +5<CR>', opts)
map('n', '<leader>-', ':vertical resize -5<CR>', opts)

-- Remaps for filetree
map('n', '<C-t>', '<cmd>lua require"nvim-tree".toggle(false,true)<CR>', opts)
map('n', '<C-n>', ':NvimTreeFindFile<CR>', opts)
map('n', '<leader>n', ':NvimTreeFocus<CR>', opts)

-- Telescope remaps
map('n', '<leader>pf', '<cmd>Telescope find_files hidden=true no_ignore=true<CR>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', opts)

-- Keep search matches in the middle of the window
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Clear matches with Ctrl+c
map("n", "<C-c>", ":noh<Cr>", opts)

-- Reselect visual block after indent/outdent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move line up and down with J/K
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Harpoon --
map('n', "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)
map('n', "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)

map('n', '<leader>fr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
