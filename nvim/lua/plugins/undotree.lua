return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>uu", "<cmd>UndotreeToggle<cr>", {
            desc = "[uu]ndotree"
        })
        vim.keymap.set(
            "n",
            "<leader>ud",
            "<cmd>UndotreeShowDiff<cr>",
            { desc = "[u]ndotree [d]iff" }
        )
        vim.keymap.set("n", "<leader>uc", "<cmd>UndotreeClear<cr>", {
            desc = "[u]ndotree clear"
        })
    end,
}
