return {
    'stevearc/conform.nvim',
    opts = {
        notify_on_error = false,
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
        formatters_by_ft = {
            go = { 'gofmt', 'goimports' },
            lua = { 'stylua' },
            javascript = { { 'eslint_d', 'prettier' } },
            svelte = { { 'eslint_d', 'prettier' } },
            typescript = { { 'eslint_d', 'prettier' } },
            typescriptreact = { { 'eslint_d', 'prettier' } },
            vue = { { 'eslint_d', 'prettier' } },
        },
    },
}
