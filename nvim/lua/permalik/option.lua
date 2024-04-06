vim.opt.guifont = 'JetBrainsMono Nerd Font Medium:h14'
-- set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true
-- default line numbers
vim.opt.number = true
-- relative line numbers
vim.opt.relativenumber = true
-- mouse mode
vim.opt.mouse = 'a'
-- do not show mode
vim.opt.showmode = false
-- cursor appearance
vim.opt.guicursor =
    'n-v-c-sm:block,i-ci-ve:ver25-Cursor-blinkwait300-blinkon200-blinkoff150,r-cr-o:hor20'
-- show which line cursor is on
vim.opt.cursorline = true
-- sync clipboard between os and neovim
vim.opt.clipboard = 'unnamedplus'
-- enable break indent
vim.opt.breakindent = true
-- enable indent in c
vim.opt.cindent = true
-- save undo history
vim.opt.undofile = true
-- case-insensitive searching, save "\C" or capital_in_search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- signcolumn on by default
vim.opt.signcolumn = 'yes'
-- colorcolumn on by default
vim.opt.colorcolumn = '100'
-- decreased update time
vim.opt.updatetime = 250
-- decrease mapped sequence wait time
-- which_key displays sooner
vim.opt.timeoutlen = 300
-- configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
-- how neovim will display certain whitespace in the editor
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- tabs behave like 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- create real tab with <C-v>tab
vim.opt.expandtab = true
-- preview substitutions live, as you type
vim.opt.inccommand = 'split'
-- minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10
-- width of number column for file
vim.opt.numberwidth = 4
-- number screenlines used for command line
vim.opt.cmdheight = 2
-- make a backup before overwriting a file
vim.opt.backup = false
-- set fileencoding when r/w file
vim.opt.fileencoding = 'utf-8'
-- highlight matches from previous search pattern
vim.opt.hlsearch = false
-- show how far a search matches while typing
vim.opt.incsearch = true
-- pop up menu dimensions in screen units
vim.opt.pumwidth = 15
vim.opt.pumheight = 15
-- enable rgb in tui
vim.opt.termguicolors = true
-- use a swapfile for the buffer
vim.opt.swapfile = false
-- break line after breaching textwidth
vim.opt.wrap = false
-- always show statusline on last window
vim.opt.laststatus = 2
-- follow indentation if already indented
vim.opt.autoindent = true
-- windows are not the same size after splitting/closing
vim.opt.equalalways = false
