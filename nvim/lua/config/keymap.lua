vim.g.mapleader = " "
vim.g.maplocalleader = " "

--
-- NORMAL
--
-- danger
vim.keymap.set("n", "Q", "<nop>")
-- go to netrw file browser
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- transparent editor
vim.keymap.set("n", "<leader>c0", ":hi Normal guibg=NONE ctermbg=NONE<cr>", {
    desc = "set [c]olorscheme 0: transparent",
    silent = true,
})
-- colorscheme
vim.keymap.set("n", "<leader>c1", ":colorscheme rose-pine-main<cr>", {
    desc = "set [c]olorscheme 1: rose-pine-main",
    silent = true,
})
vim.keymap.set("n", "<leader>c2", ":colorscheme rose-pine-moon<cr>", {
    desc = "set [c]olorscheme 2: rose-pine-moon",
    silent = true,
})
vim.keymap.set("n", "<leader>c3", ":colorscheme rose-pine-dawn<cr>", {
    desc = "set [c]olorscheme 3: rose-pine-dawn",
    silent = true,
})
vim.keymap.set("n", "<leader>c4", ":colorscheme nord<cr>", {
    desc = "set [c]olorscheme 4: nord",
    silent = true,
})
vim.keymap.set("n", "<leader>c5", ":colorscheme nordic<cr>", {
    desc = "set [c]olorscheme 5: nordic",
    silent = true,
})
vim.keymap.set("n", "<leader>c6", ":colorscheme kanagawa-dragon<cr>", {
    desc = "set [c]olorscheme 6: kanagawa-dragon",
    silent = true,
})
vim.keymap.set("n", "<leader>c7", ":colorscheme kanagawa-wave<cr>", {
    desc = "set [c]olorscheme 7: kanagawa-wave",
    silent = true,
})
vim.keymap.set("n", "<leader>c8", ":colorscheme kanagawa-lotus<cr>", {
    desc = "set [c]olorscheme 8: kanagawa-lotus",
    silent = true,
})
vim.keymap.set("n", "<leader>fg", ":Git<cr>", {
    desc = "[f]ugitive [g]it interface",
    silent = true,
})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {
	desc = "cursor in middle of screen when moving down",
	silent = true,
})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {
	desc = "cursor in middle of screen when moving up",
	silent = true,
})
vim.keymap.set("n", "J", "mzJ`z", {
	desc = "keep J in place when appending",
	silent = true,
})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {
    desc = "move selected blocks of text with proper indenting",
    silent = true,
})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {
    desc = "move selected blocks of text with proper indenting",
    silent = true,
})
vim.keymap.set("n", "<C-h>", "<C-w>h", {
	desc = "improved left window navigation",
	silent = true,
})
vim.keymap.set("n", "<C-j>", "<C-w>j", {
	desc = "improved down window navigation",
	silent = true,
})
vim.keymap.set("n", "<C-k>", "<C-w>k", {
	desc = "improved up window navigation",
	silent = true,
})
vim.keymap.set("n", "<C-l>", "<C-w>l", {
	desc = "improved right window navigation",
	silent = true,
})
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {
    desc = "open diagnostic [q]uickfix list",
})
vim.keymap.set("n", "<up>", '<cmd>echo "use k to move"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "use l to move"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "use j to move"<CR>')
vim.keymap.set("n", "<left>", '<cmd>echo "use h to move"<CR>')
--
-- SELECT
--
-- -- delete highlighted word into void register and retain copy
-- vim.keymap.set('x', '<leader>p', '"_dP')
--
-- INSERT
--
-- save vertical edits
vim.keymap.set("i", "<C-c>", "<Esc>")
--
-- TERMINAL
--
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {
	desc = "exit terminal mode",
})

