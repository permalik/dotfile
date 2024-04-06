function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<ESC>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

return {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
        require('toggleterm').setup {
            size = 10,
            open_mapping = [[<c-\>]],
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 1,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = 'horizontal',
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = 'curved',
                winblend = 3,
                highlights = {
                    border = 'Normal',
                    background = 'Normal',
                },
            },
        }

        vim.keymap.set(
            'n',
            '<leader>tf',
            '<cmd>ToggleTerm direction=float<cr>',
            { desc = '[F]loat' }
        )
        vim.keymap.set(
            'n',
            '<leader>th',
            '<cmd>ToggleTerm size=10 direction=horizontal<cr>',
            { desc = '[H]orizontal' }
        )
        vim.keymap.set(
            'n',
            '<leader>tv',
            '<cmd>ToggleTerm size=80 direction=vertical<cr>',
            { desc = '[V]ertical' }
        )
    end,
}
