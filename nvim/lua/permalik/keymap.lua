-- TODO: local opts = {noremap=true, silent=true}
-- TODO: should be able to use <C-l> to clear screen in terminal
-- __ n: normal
-- <space> is leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- danger
vim.keymap.set('n', 'Q', '<nop>')
-- netrw file browser
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
-- diagnostic
vim.keymap.set(
    'n',
    '[d',
    vim.diagnostic.goto_prev,
    { desc = 'go to previous [d]iagnostic message' }
)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'go to next [d]iagnostic message' })
vim.keymap.set(
    'n',
    '<leader>e',
    vim.diagnostic.open_float,
    { desc = 'show diagnostic [e]rror messages' }
)
vim.keymap.set(
    'n',
    '<leader>q',
    vim.diagnostic.setloclist,
    { desc = 'open diagnostic [q]uickfix list' }
)
-- colorscheme
vim.keymap.set('n', '<leader>c1', ':colorscheme rose-pine-main<cr>', {
    desc = 'set [c]olorscheme 1: dark',
    silent = true,
})
vim.keymap.set('n', '<leader>c2', ':colorscheme rose-pine-moon<cr>', {
    desc = 'set [c]olorscheme 2: mid',
    silent = true,
})
vim.keymap.set('n', '<leader>c3', ':colorscheme rose-pine-dawn<cr>', {
    desc = 'set [c]olorscheme 3: light',
    silent = true,
})
vim.keymap.set('n', '<leader>c4', ':colorscheme nord<cr>', {
    desc = 'set [c]olorscheme 4: nord',
    silent = true,
})
-- terminal
-- -- open a floating terminal
-- vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', { silent = true })
-- -- open a horizontal terminal
-- vim.keymap.set(
--     'n',
--     '<leader>th',
--     '<cmd>ToggleTerm size=20 direction=horizontal<cr>',
--     { silent = true }
-- )
-- open a vertical terminal
-- vim.keymap.set(
--     'n',
--     '<leader>tv',
--     '<cmd>ToggleTerm size=vim.o.columns * 0.4 direction=vertical<cr>',
--     { silent = true }
-- )
-- vim.keymap.set("n", "<leader>tc", "<cmd>lua _CALC_TOGGLE()<cr>", opts) -- open BC
-- vim.keymap.set("n", "<leader>tl", "<cmd>lua _LUA_TOGGLE()<cr>", opts) -- open a Lua repl
-- vim.keymap.set("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", opts) -- open a Python repl
-- vim.keymap.set("n", "<leader>tm", "<cmd>lua _MAKE_TOGGLE()<cr>", opts) --  run make in a vertical toggleterm instance
-- vim.keymap.set("n", "<leader>tr", "<cmd>lua _RUBY_TOGGLE()<cr>", opts) -- open IRB
-- fugitive
vim.keymap.set('n', '<leader>gg', '<cmd>Git<cr>', { silent = true })
vim.keymap.set('n', '<leader>ga', '<cmd>Git add -A<cr>', { silent = true })
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<cr>', { silent = true })
vim.keymap.set('n', '<leader>r', vim.cmd.redo, { desc = '[<leader>r]edo' })
-- keep cursor in middle of screen when i move down
vim.keymap.set('n', '<C-d>', '<C-d>zz', { silent = true })
-- keep cursor in middle of screen when i move up
vim.keymap.set('n', '<C-u>', '<C-u>zz', { silent = true })
-- keep your J in place when appending
vim.keymap.set('n', 'J', 'mzJ`z', { silent = true })
-- __ v: visual
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", {
    desc = 'move selected blocks of text with proper indenting',
    silent = true,
})
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", {
    desc = 'move selected blocks of text with proper indenting',
    silent = true,
})
-- better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })
-- __ x: select
-- -- delete highlighted word into void register and retain copy
-- vim.keymap.set('x', '<leader>p', '"_dP')
-- __ i: insert
-- save vertical edits
vim.keymap.set('i', '<C-c>', '<Esc>')
