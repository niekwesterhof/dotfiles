--[[ keymaps for init.lua]]
vim.keymap.set('i', 'jj', '<Esc>')
vim.api.nvim_set_keymap('n', 'QQ', ':q!<enter>', { noremap = false })
vim.api.nvim_set_keymap('n', 'WW', ':w!<enter>', { noremap = false })
vim.keymap.set('n', '<C-S>', ':w<enter>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>De', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

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

vim.keymap.set('n', '<m-h>', '10h')
vim.keymap.set('n', '<m-k>', '10k')
vim.keymap.set('n', '<m-j>', '10j')
vim.keymap.set('n', '<m-l>', '10l')

-- NOTE: Noice Message
vim.keymap.set('n', '<leader>nd', '<cmd>NoiceDismiss<CR>', { desc = 'Dismiss Noice Message' })

-- NOTE:  trailspace
vim.keymap.set('n', '<leader>tt', '<cmd>lua MiniTrailspace.trim()<CR>', { desc = 'Trim all trailing whitespaces' })
vim.keymap.set('n', '<leader>ta', '<cmd>lua MiniTrailspace.trim_all_lines()<CR>', { desc = 'Trim all trailing empty lines' })

-- NOTE: hop
vim.keymap.set({ 'n', 'x', 'o' }, 'he', ':HopChar1<CR>', { desc = 'Hop to 1 char' })
vim.keymap.set({ 'n', 'x', 'o' }, 'hc', '<cmd>HopChar2<CR>', { desc = 'Hop to 2 char' })
vim.keymap.set({ 'n', 'x', 'o' }, 'hw', '<cmd>HopWord<CR>', { desc = 'Hop Word' })
vim.keymap.set({ 'n', 'x', 'o' }, 'hs', '<cmd>HopLineStart<CR>', { desc = 'Hop to line' })
vim.keymap.set({ 'n', 'x', 'o' }, 'hl', '<cmd>HopLine<CR>', { desc = 'Hop to begin line' })
vim.keymap.set({ 'n', 'x', 'o' }, 'hv', '<cmd>HopeVertical<CR>', { desc = 'Hop vertical' })
vim.keymap.set({ 'n', 'x', 'o' }, 'hP', '<cmd>HopPattern<CR>', { desc = 'Hop Pattern' })
vim.keymap.set({ 'n', 'x', 'o' }, 'hp', '<cmd>HopPasteChar1<CR>', { desc = 'Hop Paste to 1 char' })
vim.keymap.set({ 'n', 'x', 'o' }, 'hy', '<cmd>HopYankChar1<CR>', { desc = 'Hop Yank at start char and end char' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>hC', ':HopChar1<CR>', { desc = 'Hop to 1 char' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>hc', '<cmd>HopChar2<CR>', { desc = 'Hop to 2 char' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>hw', '<cmd>HopWord<CR>', { desc = 'Hop Word' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>hs', '<cmd>HopLineStart<CR>', { desc = 'Hop to line' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>hl', '<cmd>HopLine<CR>', { desc = 'Hop to begin line' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>hv', '<cmd>HopeVertical<CR>', { desc = 'Hop vertical' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>hP', '<cmd>HopPattern<CR>', { desc = 'Hop Pattern' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>hp', '<cmd>HopPasteChar1<CR>', { desc = 'Hop Paste to 1 char' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>hy', '<cmd>HopYankChar1<CR>', { desc = 'Hop Yank at start char and end char' })

-- NOTE: Run script
function RunScript()
  -- Save and run python script in floaterm
  vim.cmd 'w'
  local file = vim.fn.expand '%'
  -- vim.cmd 'FloatermToggle'
  -- vim.cmd('FloatermSend ./' .. file)
  vim.cmd('TermExec cmd="./' .. file '"')
end

-- NOTE: Run Python script
function RunPython()
  -- Save and run python script in floaterm
  vim.cmd 'wa'
  -- vim.cmd 'buf main.py'
  local file = vim.fn.expand '%'
  vim.cmd 'TermExec cmd="python3 main.py"'
  -- vim.cmd 'FloatermToggle'
  -- vim.cmd('FloatermSend python3 ' .. file)
end

function DebugPython()
  vim.cmd 'wa'
  require('dap').continue()
end

function RunCpp()
  vim.cmd 'w'
  local file = vim.fn.expand '%'
  local filewo = vim.fn.expand '%:r'
  -- vim.cmd 'FloatermToggle'
  -- vim.cmd('FloatermSend g++ -Wall ' .. file .. ' -o ' .. filewo .. '.out && ./' .. filewo .. '.out')
  vim.cmd('TermExec cmd="g++ -Wall ' .. file .. ' -o ' .. filewo .. '.out && ./' .. filewo .. '.out"')
end

vim.keymap.set({ 'n' }, '<leader>rb', RunScript, { desc = 'run [b]ash Script' })
vim.keymap.set({ 'n' }, '<leader>dp', DebugPython, { desc = 'Debug [p]ython script' })
vim.keymap.set({ 'n' }, '<leader>rp', RunPython, { desc = 'Run [p]thon script' })
-- vim.keymap.set({ 'n', 't' }, '<leader>Tt', '<cmd>FloatermToggle<CR>', { desc = 'Toggle floaterm' })
vim.keymap.set('n', '<leader>rc', RunCpp, { desc = 'Build and [R]un [C]++ file' })

-- NOTE: Nerdy
vim.keymap.set('n', '<leader>nn', '<cmd>Nerdy<CR>', { desc = 'Nerd fonts' })

-- NOTE: Telescope
-- local actions = require 'telescope.actions'
local open_with_trouble = require('trouble.sources.telescope').open
-- Use this to add more results without clearing the trouble list
local add_to_trouble = require('trouble.sources.telescope').add
local to_fuzzy_refine = require('telescope.actions').to_fuzzy_refine
local builtin = require 'telescope.builtin'
-- vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
-- vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
-- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
-- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sp', function()
--   builtin.find_files { search_dirs = { '~/Documents/projects/' }, hidden = true, prompt_title = 'Search files in projects' }
-- end, { desc = '[S]earch in [p]rojects' })
-- vim.keymap.set('n', '<leader>sd', function()
--   builtin.find_files { search_dirs = { '~/dotfiles/' }, hidden = true, prompt_title = 'Search files in dotfiles' }
-- end, { desc = '[S]earch in [d]otfiles' })
-- vim.keymap.set('n', '<leader>sa', function()
--   builtin.find_files { search_dirs = { '~/' }, hidden = true, prompt_title = 'Search all files' }
-- end, { desc = '[S]earch in all [f]iles' })
-- vim.keymap.set('n', '<leader>svg', function()
--   builtin.live_grep { search_dirs = { '~/Documents/Vault' }, prompt_title = 'Search by grep in Vault' }
-- end, { desc = '[S]earch in [V]ault [G]rep' })
-- vim.keymap.set('n', '<leader>svf', function()
--   builtin.find_files { search_dirs = { '~/Documents/Vault' }, prompt_title = 'Search files in Vault' }
-- end, { desc = '[S]earch in [V]ault [F]iles' })
-- vim.keymap.set('n', '<leader>sD', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
-- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
-- vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
-- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

-- Slightly advanced example of overriding default behavior and theme
-- vim.keymap.set('n', '<leader>f/', function()
--   -- You can pass additional configuration to Telescope to change the theme, layout, etc.
--   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
-- vim.keymap.set('n', '<leader>s/', function()
--   builtin.live_grep {
--     grep_open_files = true,
--     prompt_title = 'Live Grep in Open Files',
--   }
-- end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
-- vim.keymap.set('n', '<leader>sn', function()
--   builtin.find_files { cwd = vim.fn.stdpath 'config' }
-- end, { desc = '[S]earch [N]eovim config files' })
-- vim.keymap.set('i', '<c-enter>', to_fuzzy_refine, { desc = 'Fuzzy refine' })
-- vim.keymap.set({ 'n', 'i' }, '<c-t>', open_with_trouble, { desc = 'Telescope with Trouble' })

-- NOTE: persistance
-- load the session for the current directory
vim.keymap.set('n', '<leader>ps', function()
  require('persistence').load()
end, { desc = 'persistence load session from dir' })

-- select a session to load
vim.keymap.set('n', '<leader>pS', function()
  require('persistence').select()
end, { desc = 'persistence select session to load' })

-- load the last session
vim.keymap.set('n', '<leader>pl', function()
  require('persistence').load { last = true }
end, { desc = 'persistence load last session' })

-- stop Persistence => session won't be saved on exit
vim.keymap.set('n', '<leader>pd', function()
  require('persistence').stop()
end, { desc = "stop persistence, session won't be saved on exit" })

-- NOTE: Yazi
vim.keymap.set('n', '<leader>yw', 'none', { desc = 'Current Working directory' })
vim.keymap.set('n', '<leader>yf', 'none', { desc = 'Current file' })

-- NOTE: Symbols-Outline
vim.keymap.set('n', '<leader>o', '<cmd> SymbolsOutline <CR>', { desc = 'Symbols Outline' })

-- NOTE: Group names
vim.keymap.set('n', '<leader>p', 'none', { desc = 'persistence' })
vim.keymap.set('n', '<leader>x', 'none', { desc = 'trouble' })
vim.keymap.set('n', '<leader>g', 'none', { desc = 'git' })
vim.keymap.set('n', '<leader>D', 'none', { desc = 'diagnostic' })
vim.keymap.set('n', '<leader>s', 'none', { desc = 'search' })
vim.keymap.set('n', '<leader>S', 'none', { desc = 'surround' })
vim.keymap.set('n', '<leader>r', 'none', { desc = 'run' })
vim.keymap.set('n', '<leader>d', 'none', { desc = 'debug' })
vim.keymap.set('n', '<leader>l', 'none', { desc = 'lsp' })
vim.keymap.set('n', '<leader>h', 'none', { desc = 'hop' })
vim.keymap.set('n', '<leader>n', 'none', { desc = 'noice + nerdy' })
vim.keymap.set('n', '<leader>t', 'none', { desc = 'trim' })
vim.keymap.set('n', '<leader>y', 'none', { desc = 'yazi' })
vim.keymap.set('n', '<leader>F', 'none', { desc = 'format' })
vim.keymap.set('n', '<leader>f', 'none', { desc = 'files' })
vim.keymap.set('n', '<leader>b', 'none', { desc = 'buffers' })
vim.keymap.set('n', '<leader>u', 'none', { desc = 'utils' })
