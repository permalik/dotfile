return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local harpoon = require 'harpoon'
        harpoon:setup {}

        vim.keymap.set('n', '<leader>a', function()
            harpoon:list():append()
        end, { desc = '[a]ppend harpoon buffer' })
        vim.keymap.set('n', '<space>\\a', function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = '[a]ll harpoon buffers' })
        vim.keymap.set('n', '<space>\\q', function()
            harpoon:list():select(1)
        end, { desc = 'harpoon bay [q]/1' })
        vim.keymap.set('n', '<space>\\w', function()
            harpoon:list():select(2)
        end, { desc = 'harpoon bay [w]/2' })
        vim.keymap.set('n', '<space>\\e', function()
            harpoon:list():select(3)
        end, { desc = 'harpoon bay [e]/3' })
        vim.keymap.set('n', '<space>\\r', function()
            harpoon:list():select(4)
        end, { desc = 'harpoon bay [r]/4' })
        vim.keymap.set('n', '<space>\\s', function()
            harpoon:list():prev()
        end, { desc = '[s]/previous harpoon bay' })
        vim.keymap.set('n', '<space>\\d', function()
            harpoon:list():next()
        end, { desc = '[d]/next harpoon bay' })
    end,
}
