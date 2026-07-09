return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "Bilal2453/luvit-meta", lazy = true,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            { "j-hui/fidget.nvim",       opts = {} },
            "hrsh7th/cmp-nvim-lsp",
            "MunifTanjim/prettier.nvim",
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    map("gd", require("telescope.builtin").lsp_definitions, "[g]oto [d]efinition")
                    map("gr", require("telescope.builtin").lsp_references, "[g]oto [r]eferences")
                    map("gI", require("telescope.builtin").lsp_implementations, "[g]oto [i]mplementation")
                    map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [d]efinition")
                    map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[d]ocument [s]ymbols")
                    map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[w]orkspace [s]ymbols")
                    map("<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame")
                    map("<leader>ca", vim.lsp.buf.code_action, "[c]ode [a]ction", { "n", "x" })
                    map("gD", vim.lsp.buf.declaration, "[g]oto [d]eclaration")

                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                        local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd("LspDetach", {
                            group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds { group = "lsp-highlight", buffer = event2.buf }
                            end,
                        })
                    end

                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                        map("<leader>th", function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
                        end, "[t]oggle inlay [h]ints")
                    end
                end,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

            local on_attach = function(client)
                require'completion'.on_attach(client)
            end

            local servers = {
                -- ansiblels = {},
                -- npm install -g @astrojs/language-server
                -- arduino_language_server = {},
                astro = {},
                -- awk_ls = {},
                -- npm i -g bash-language-server
                bashls = {},
                clangd = {},
                -- clojure_lsp = {},
                cmake = {},
                -- csharp = {},
                -- npm i -g vscode-langservers-extracted
                cssls = {},
                -- npm install -g dockerfile-language-server-nodejs
                dockerls = {},
                -- elixirls = {},
                -- elmls = {},
                -- npm install -g @olrtg/emmet-language-server
                emmet_language_server = {},
                -- erlangls = {},
                -- eslint = {},
                -- fennel = {},
                -- fsharp_language_server = {},
                -- gleam = {},
                gopls = {},
                -- npm i -g vscode-langservers-extracted
                html = {},
                -- cargo install htmx-lsp
                -- htmx = {},
                -- intelephense = {},
                -- jdtls = {},
                -- jinja_lsp = {},
                -- jqls = {},
                -- npm i -g vscode-langservers-extracted
                jsonls = {},
                -- kotlin_language_server = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = {
                                callSnippet = "Replace",
                            },
                            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                            diagnostics = {
                                disable = {
                                    "missing-fields",
                                    "lowercase-global",
                                }
                            },
                        },
                    },
                },
                -- https://github.com/artempyanykh/marksman/releases
                marksman = {},
                -- metals = {},
                -- mojo = {},
                -- nginx_language_server = {},
                -- nixd = {},
                -- ocamlls = {},
                -- ocamllsp = {},
                -- omnisharp = {},
                -- powershell = {},
                -- pnpm install -g pyright
                pyright = {},
                -- qml_lsp = {},
                -- qmlls = {},
                -- https://github.com/jeapostrophe/racket-langserver
                -- rnix = {},
                -- ruff = {},
                -- ruff_lsp = {},
                -- https://github.com/rust-lang/rust-analyzer
                rust_analyzer = {},
                slint_lsp = {},
                -- sqlls = {},
                -- sqls = {},
                -- npm install -g svelte-language-server
                svelte = {},
                -- npm install -g @tailwindcss/language-server
                tailwindcss = {},
                -- terraform_lsp = {},
                -- npm install -g typescript typescript-language-server
                ts_ls = {},
                -- npm install -g vim-language-server
                vimls = {},
                -- volar = {},
                -- vuels = {},
                -- yamlls = {},
                -- https://github.com/zigtools/zls
                zls = {},
            }

            -- require("lspconfig").qmlls.setup({
            --     cmd = {
            --         "/Users/tymalik/Qt/6.7.3/macos/bin/qmlls"
            --     },
            -- })
            -- require("lspconfig").hls.setup({
            --     filetypes = {
            --         "haskell",
            --         "lhaskell",
            --         "cabal",
            --     },
            --     settings = {
            --         haskell = {
            --             hlintOn = true,
            --             cabalFormattingProvider = "cabalfmt",
            --             formattingProvider = "ormolu",
            --         }
            --     },
            -- })

            require("lspconfig").racket_langserver.setup {
                cmd = { "racket", "-l", "racket-langserver" },
                filetypes = { "racket" },
                root_dir = require('lspconfig').util.root_pattern("racket-project.rkt", ".git"),
            }

            -- require('mason-lspconfig').setup_handlers {
            --     ['rust_analyzer'] = function() end,
            -- }

            require("mason").setup()

            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                "slint_lsp",
                "stylua",
                "ts_ls",
            })
            require("mason-tool-installer").setup { ensure_installed = ensure_installed }

            local noop = function() end

            require("mason-lspconfig").setup {
                handlers = {
                    function(server_name)
                        if server_name == "cssls" then
                            local cssls_capabilities = vim.tbl_deep_extend("force", {}, capabilities)
                            cssls_capabilities.textDocument.completion.completionItem.snippetSupport = true
                            require("lspconfig")[server_name].setup({
                                capabilities = cssls_capabilities
                            })
                        end

                        if server_name == "html" then
                            local cssls_capabilities = vim.tbl_deep_extend("force", {}, capabilities)
                            cssls_capabilities.textDocument.completion.completionItem.snippetSupport = true
                            require("lspconfig")[server_name].setup({
                                capabilities = cssls_capabilities
                            })
                        end

                        -- if server_name == "htmx" then
                        --     local lspconfig = require("lspconfig")
                        --     lspconfig.htmx.setup {}
                        -- end

                        if server_name == "jsonls" then
                            local cssls_capabilities = vim.tbl_deep_extend("force", {}, capabilities)
                            cssls_capabilities.textDocument.completion.completionItem.snippetSupport = true
                            require("lspconfig")[server_name].setup({
                                capabilities = cssls_capabilities
                            })
                        end

                        if server_name == "rust_analyzer" then
                            require("lspconfig")[server_name].setup({
                                on_attach = on_attach,
                                settings = {
                                    ["rust-analyzer"] = {
                                        imports = {
                                            granularity = {
                                                group = "module",
                                            },
                                            prefix = "self",
                                        },
                                        cargo = {
                                            buildScripts = {
                                                enable = true,
                                            },
                                        },
                                        procMacro = {
                                            enable = true
                                        },
                                    }
                                }
                            })
                        end
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        require("lspconfig")[server_name].setup(server)
                    end,
                    ['jdtls'] = noop,
                },
            }
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                on_attach = function(client, bufnr)
                    if client.resolved_capabilities.document_formatting then
                        vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")

                        -- format on save
                        vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
                    end

                    if client.resolved_capabilities.document_range_formatting then
                        vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
                    end
                end,
            })

            local prettier = require("prettier")

            prettier.setup({
                bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
                filetypes = {
                    "css",
                    "graphql",
                    "html",
                    "javascript",
                    "javascriptreact",
                    "json",
                    "less",
                    "markdown",
                    "scss",
                    "typescript",
                    "typescriptreact",
                    "yaml",
                },
            })
        end
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_format = "fallback" })
                end,
                mode = "",
                desc = "[f]ormat buffer"
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                local disable_filetypes = { c = true, cpp = true }
                local lsp_format_opt
                if disable_filetypes[vim.bo[bufnr].filetype] then
                    lsp_format_opt = 'never'
                else
                    lsp_format_opt = 'fallback'
                end
                return {
                    timeout_ms = 500,
                    lsp_format = lsp_format_opt,
                }
            end,
            formatters_by_ft = {
                haskell = { "ormolu" },
                lua = { "stylua" },
                nix = { "alejandra" },
                -- Conform can also run multiple formatters sequentially
                python = { "isort", "black" },
                --
                -- You can use 'stop_after_first' to run the first available formatter from the list
                -- javascript = { "prettierd", "prettier", stop_after_first = true },
            },
        },
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            {
                "L3MON4D3/LuaSnip",
                build = (function()
                    -- Build Step is needed for regex support in snippets.
                    -- This step is not supported in many windows environments.
                    -- Remove the below condition to re-enable on windows.
                    if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
                        return
                    end
                    return "make install_jsregexp"
                end)(),
                dependencies = {
                    -- `friendly-snippets` contains a variety of premade snippets.
                    --    See the README about individual language/framework/plugin snippets:
                    --    https://github.com/rafamadriz/friendly-snippets
                    -- {
                    --   "rafamadriz/friendly-snippets",
                    --   config = function()
                    --     require("luasnip.loaders.from_vscode").lazy_load()
                    --   end,
                    -- },
                },
            },
            "saadparwaiz1/cmp_luasnip",

            -- Adds other completion capabilities.
            --  nvim-cmp does not ship with all sources by default. They are split
            --  into multiple repos for maintenance purposes.
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
        },
        config = function()
            -- See `:help cmp`
            local cmp = require "cmp"
            local luasnip = require "luasnip"
            luasnip.config.setup {}

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = { completeopt = "menu,menuone,noinsert" },

                -- For an understanding of why these mappings were
                -- chosen, you will need to read `:help ins-completion`
                --
                -- No, but seriously. Please read `:help ins-completion`, it is really good!
                mapping = cmp.mapping.preset.insert {
                    -- Select the [n]ext item
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    -- Select the [p]revious item
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    -- Scroll the documentation window [b]ack / [f]orward
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    -- Accept ([y]es) the completion.
                    ["<C-y>"] = cmp.mapping.confirm { select = true },
                    -- Manually trigger a completion from nvim-cmp.
                    --  Generally you don"t need this, because nvim-cmp will display
                    --  completions whenever it has completion options available.
                    ["<C-Space>"] = cmp.mapping.complete {},
                    -- Think of <c-l> as moving to the right of your snippet expansion.
                    --  So if you have a snippet that"s like:
                    --  function $name($args)
                    --    $body
                    --  end
                    --
                    -- <c-l> will move you to the right of each of the expansion locations.
                    -- <c-h> is similar, except moving you backwards.
                    ["<C-l>"] = cmp.mapping(function()
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        end
                    end, { "i", "s" }),
                    ["<C-h>"] = cmp.mapping(function()
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        end
                    end, { "i", "s" }),
                    -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
                    --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
                },
                sources = {
                    {
                        name = "lazydev",
                        -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
                        group_index = 0,
                    },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                },
            }
        end,
    },
}
