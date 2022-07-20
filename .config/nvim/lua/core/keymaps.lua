-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Personal shortcuts
-----------------------------------------------------------

-- Map Esc to ;;
map('i', ';;', '<Esc>')
map('v', ';;', '<Esc>')

-- Undo/redo during inserting text
map('i', '<C-z>', '<Cmd>:undo<CR>')
map('v', '<C-z>', '<Cmd>:undo<CR>')
map('i', '<S-C-z>', '<Cmd>:redo<CR>')
map('v', '<S-C-z>', '<Cmd>:redo<CR>')

-- Stay in indent mode
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Stay in normal/visual mode when entering
map('n', '<CR>', 'i<CR><esc>')
map('v', '<CR>', 'i<CR><esc>')

-- Move text up and down
map('v', '<A-j>', ':m .+1<CR>==gv')
map('v', '<A-k>', ':m .-2<CR>==gv')
map("v", "p", '"_dP')

-- Move block of text up and down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>')
vim.opt.pastetoggle = '<F2>'

-- Move around window splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Fast saving with Ctrl + s
map('n', '<C-s>', ':w<CR>')

-- Select All with Ctrl + a
map('n', '<C-a>', 'gg<S-v>G')
map('v', '<C-a>', 'gg<S-v>G')

-- Easier Replace
map('n', 'r', 'R')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

-- Increment/decrement digits
map('n', '+', '<C-a>')
map('n', '-', '<C-x>')

-- Delete without yanking
map('n', '<leader>d', '"_d')
map('n', 'x', '"_x')

-----------------------------------------------------------
-- Windows and Tabs Management
-----------------------------------------------------------

-- Open current directory + File
map('n', 'te', ':tabedit<CR>') -- new tab
map('n', '<S-Tab>', ':tabprev<Return>') -- prev tab
map('n', '<Tab>', ':tabnext<Return>') -- next tab

-- Splitting windows
map('n', 'ss', ':split<Return><C-w>w') -- split windows (horizontal)
map('n', 'sv', ':vsplit<Return><C-w>w') -- split windows (vertical)
map('n', 'sq', '<C-w>q') -- close split windows

-- Navigating through split windows
map('n', 's<left>', '<C-w>h')
map('n', 's<up>', '<C-w>k')
map('n', 's<down>', '<C-w>j')
map('n', 's<right>', '<C-w>l')

map('n', 'sh', '<C-w>h')
map('n', 'sk', '<C-w>k')
map('n', 'sj', '<C-w>j')
map('n', 'sl', '<C-w>l')

-- Move to previous/next tab
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>')
map('n', '<A-.>', '<Cmd>BufferNext<CR>')

-- Re-order to previous/next tab
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>')
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>')

-- Goto buffer in position <x>
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>')
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>')
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>')
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>')
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>')
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>')
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>')
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>')
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>')
map('n', '<A-0>', '<Cmd>BufferLast<CR>')

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>')

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>')

-- Magic buffer-picking mode
map('n', '<A-p>', '<Cmd>BufferPick<CR>')

-----------------------------------------------------------
-- Telescope settings
-----------------------------------------------------------

-- Telescope
map('n', ';f', "<cmd>Telescope find_files<cr>")
map('n', '<C-p>', "<cmd>Telescope oldfiles<cr>")
map('n', ';r', "<cmd>Telescope live_grep<cr>")
map('n', ';t', "<cmd>Telescope buffers<cr>")
map('n', ';h', "<cmd>Telescope help_tags<cr>")
map('n', ';d', "<cmd>Telescope diagnostics<cr>")
map('n', ';ls', "<cmd>Telescope file_browser<cr>")

-----------------------------------------------------------
-- NvimTree(Directory Listing) shortcuts
-----------------------------------------------------------
map("n", "<leader>e", ":NvimTreeToggle<cr>")
map("n", "ff", ":Format<CR>")
