return {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("nordic").setup({
            on_highlight = function(highlights, palette)
                highlights.Visual = { bg = palette.gray3 }
                highlights.VisualLine = { bg = palette.gray3 }
                -- highlights.Normal = { fg = palette.red.bright, bg = palette.green.base }
                -- highlights.Comment = { fg = palette.red.bright, italic = true }
                -- highlights.Function = { fg = palette.red.bright, bold = true }
                -- highlights.TelescopePromptTitle = {
                --     fg = palette.red.bright,
                --     bg = palette.green.base,
                --     italic = true,
                --     underline = true,
                --     sp = palette.yellow.dim,
                --     undercurl = false
                -- }
            end,
        })
        require("nordic").load()
        vim.cmd 'colorscheme nordic'
    end
}
