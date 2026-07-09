return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require "harpoon"
        harpoon:setup {}

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "[a]ppend harpoon buffer" })
        vim.keymap.set("n", "<leader>\\a", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "[a]ll harpoon buffers" })
        vim.keymap.set("n", "<leader>\\q", function()
            harpoon:list():select(1)
        end, { desc = "[q] harpoon bay 1" })
        vim.keymap.set("n", "<leader>\\w", function()
            harpoon:list():select(2)
        end, { desc = "[w] harpoon bay 2" })
        vim.keymap.set("n", "<leader>\\e", function()
            harpoon:list():select(3)
        end, { desc = "[e] harpoon bay 3" })
        vim.keymap.set("n", "<leader>\\r", function()
            harpoon:list():select(4)
        end, { desc = "[r] harpoon bay 4" })
        vim.keymap.set("n", "<leader>\\z", function()
            harpoon:list():select(5)
        end, { desc = "[z] harpoon bay 5" })
        vim.keymap.set("n", "<leader>\\x", function()
            harpoon:list():select(6)
        end, { desc = "[x] harpoon bay 6" })
        vim.keymap.set("n", "<leader>\\c", function()
            harpoon:list():select(7)
        end, { desc = "[c] harpoon bay 7" })
        vim.keymap.set("n", "<leader>\\v", function()
            harpoon:list():select(8)
        end, { desc = "[v] harpoon bay 8" })
        vim.keymap.set("n", "<leader>\\f", function()
            harpoon:list():select(9)
        end, { desc = "[9] harpoon bay 9" })
        vim.keymap.set("n", "<leader>\\s", function()
            harpoon:list():prev()
        end, { desc = "[s] previous harpoon bay" })
        vim.keymap.set("n", "<leader>\\d", function()
            harpoon:list():next()
        end, { desc = "[d] next harpoon bay" })
    end,
}
