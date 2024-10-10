--[[ keymaps for init.lua]]

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- KEY:  Tmux control map
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Noice Message
vim.keymap.set('n', '<leader>nd', '<cmd>NoiceDismiss<CR>', { desc = 'Dismiss Noice Message' })

-- NOTE: Open Zoxide telescope extension
vim.keymap.set('n', '<leader>Z', '<cmd>Z<CR>', { desc = 'Open Zoxide' })

-- NOTE: Obsidian
vim.keymap.set('n', '<leader>oc', "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", { desc = 'Obsidian Check Checkbox' })
vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianTemplate<CR>', { desc = 'Insert Obsidian Template' })
vim.keymap.set('n', '<leader>oo', '<cmd>ObsidianOpen<CR>', { desc = 'Open in Obsidian App' })
vim.keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = 'Show ObsidianBacklinks' })
vim.keymap.set('n', '<leader>ol', '<cmd>ObsidianLinks<CR>', { desc = 'Show ObsidianLinks' })
vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNew<CR>', { desc = 'Create New Note' })
vim.keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<CR>', { desc = 'Search Obsidian' })
vim.keymap.set('n', '<leader>oq', '<cmd>ObsidianQuickSwitch<CR>', { desc = 'Quick Switch' })

-- NOTE: neo-tree
vim.keymap.set('n', '<leader><Tab>', ':Neotree filesystem toggle float <CR>', { desc = 'Toggle floating Neotree' })
vim.keymap.set('n', '<leader>n', ':Neotree filesystem toggle left <CR>', { desc = 'Toggle neotree left' })

-- NOTE:  trailspace
vim.keymap.set('n', '<leader>tt', '<cmd>lua MiniTrailspace.trim()<CR>', { desc = 'Trim all trailing whitespaces' })
vim.keymap.set('n', '<leader>ta', '<cmd>lua MiniTrailspace.trim_all_lines()<CR>', { desc = 'Trim all trailing empty lines' })

-- NOTE: hop
-- vim.keymap.set('', 'f', function()
--   require('hop').hint_char1 { direction = require('hop.hint').HintDirection.directions.AFTER_CURSOR, current_line_only = true }
-- end, { remap = true })
-- vim.keymap.set('', 'F', function()
--   require('hop').hint_char1 { direction = require('hop.hint').HintDirection.directions.BEFORE_CURSOR, current_line_only = true }
-- end, { remap = true })
-- vim.keymap.set('', 't', function()
--   require('hop').hint_char1 { direction = require('hop.hint').HintDirection.directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
-- end, { remap = true })
-- vim.keymap.set('', 'T', function()

vim.keymap.set({ 'n', 'x', 'o' }, 'sC', ':HopChar1<CR>', { desc = 'Hop to 1 char' })
vim.keymap.set({ 'n', 'x', 'o' }, 'sc', '<cmd>HopChar2<CR>', { desc = 'Hop to 2 char' })
vim.keymap.set({ 'n', 'x', 'o' }, 'sw', '<cmd>HopWord<CR>', { desc = 'Hop Word' })
vim.keymap.set({ 'n', 'x', 'o' }, 'ss', '<cmd>HopLineStart<CR>', { desc = 'Hop to line' })
vim.keymap.set({ 'n', 'x', 'o' }, 'sl', '<cmd>HopLine<CR>', { desc = 'Hop to begin line' })
vim.keymap.set({ 'n', 'x', 'o' }, 'sv', '<cmd>HopeVertical<CR>', { desc = 'Hop vertical' })
vim.keymap.set({ 'n', 'x', 'o' }, 'sP', '<cmd>HopPattern<CR>', { desc = 'Hop Pattern' })
vim.keymap.set({ 'n', 'x', 'o' }, 'sp', '<cmd>HopPasteChar1<CR>', { desc = 'Hop Paste to 1 char' })
vim.keymap.set({ 'n', 'x', 'o' }, 'sy', '<cmd>HopYankChar1<CR>', { desc = 'Hop Yank at start char and end char' })


-- NOTE Run Python script
function runPython()
  -- Save and run python script in floaterm
  vim.cmd('w')
  local file = vim.fn.expand('%')
  vim.cmd('FloatermToggle')
  vim.cmd('FloatermSend python3 '.. file)
end

vim.keymap.set({'n'},'<leader>rp', runPython, {desc = '[R]un [P]ython script'})
vim.keymap.set({'n', 't'}, '<F12>', '<cmd>FloatermToggle<CR>', {desc = 'Toggle floaterm'})
vim.keymap.set('n', '<leader>rc', '<cmd>:w<CR> :FloatermToggle<CR> g++ -Wall ' .. vim.fn.expand('%') .. ' -o ' .. vim.fn.expand('%:r') .. '.out && ./' .. vim.fn.expand('%:r') .. '.out<CR>', { desc = 'Build and [R]un [C]++ file' })
