return {
    dir = "~/Documents/git/annex_aegis",
    config = function()
        local annex = require('annex')
        annex.setup()

        vim.keymap.set("n", "<leader>at", function()
            annex.create_temp()
        end, { desc = "[a]nnex [t]emp" })
        vim.keymap.set("n", "<leader>as", function()
            annex.save_temp()
        end, { desc = "[a]nnex [s]ave" })
        vim.keymap.set("n", "<leader>ac", function()
            annex.close_temp()
        end, { desc = "[a]nnex [c]lose" })
        vim.keymap.set("n", "<esc>", function()
            annex.close_temp()
        end, { desc = "[a]nnex [c]lose"})
        vim.keymap.set("n", "<leader>an", function()
            annex.next_field()
        end, { desc = "[a]nnex [n]ext" })
        vim.keymap.set("n", "<leader>ap", function()
            annex.prev_field()
        end, { desc = "[a]nnex [p]rev" })
    end,
}
