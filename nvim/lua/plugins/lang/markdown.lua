LazyVim.on_very_lazy(function()
    vim.filetype.add({
        extension = { mdx = "markdown.mdx" },
    })
end)

return {
    {
        "davidmh/mdx.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = { "rumdl", "markdown-toc" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                marksman = {},
            },
        },
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = function()
            require("lazy").load({ plugins = { "markdown-preview.nvim" } })
            vim.fn["mkdp#util#install"]()
        end,
        keys = {
            {
                "<leader>cp",
                ft = "markdown",
                "<cmd>MarkdownPreviewToggle<cr>",
                desc = "Markdown Preview",
            },
        },
        config = function()
            vim.cmd([[do FileType]])
        end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        enabled = false,
    },
    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters = {
                ["markdown-toc"] = {
                    condition = function(_, ctx)
                        for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
                            if line:find("<!%-%- toc %-%->") then
                                return true
                            end
                        end
                    end,
                },
                ["rumdl"] = {
                    condition = function(_, ctx)
                        local diag = vim.tbl_filter(function(d)
                            return d.source == "rumdl"
                        end, vim.diagnostic.get(ctx.buf))
                        return #diag > 0
                    end,
                },
            },
            formatters_by_ft = {
                ["markdown"] = { "rumdl", "markdown-toc" },
                ["markdown.mdx"] = { "rumdl", "markdown-toc" },
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        optional = true,
        opts = {
            linters_by_ft = {
                markdown = { "rumdl" },
                ["markdown.mdx"] = { "rumdl" },
            },
        },
    },
    {
        "hedyhli/markdown-toc.nvim",
        ft = "markdown", -- Lazy load on markdown filetype
        cmd = { "Mtoc" }, -- Or, lazy load on "Mtoc" command
        opts = {
            headings = {
                before_toc = false,
                exclude = {},
                -- The first capture is for heading level ('###') and second is for the heading
                -- title.
                pattern = "^(#+)%s+(.+)$",
            },

            -- Config relating to the style and format of the ToC
            toc_list = {

                markers = "-",
                cycle_markers = false,

                indent_size = 4,

                item_format_string = "${indent}${marker} [${name}](#${link})",

                ---Formatter for a single ToC list item.
                -- `item_info` has fields `name`, `link`, `marker`, `indent`, To change the
                -- format of each heading item but keep the same field substitution syntax,
                -- simply change `item_format_string`.
                ---@param item_info table Information for current heading item.
                ---@param fmtstr string from `item_format_string` config
                ---@return string formatted_item
                item_formatter = function(item_info, fmtstr)
                    local s = fmtstr:gsub([[${(%w-)}]], function(key)
                        return item_info[key] or ("${" .. key .. "}")
                    end)
                    return s
                end,

                post_processor = function(lines)
                    return lines
                end,

                padding_lines = 1,
            },

            -- Table or boolean. Set to true to use these defaults, set to false to disable completely.
            -- Fences are needed for the update/remove commands.
            fences = {
                enabled = true,
                -- These fence texts are wrapped within "<!-- % -->", where the '%' is
                -- substituted with the text.
                start_text = "toc-start",
                end_text = "mtoc-end",
                -- An empty line is inserted on top and below the ToC list before the being
                -- wrapped with the fence texts, same as vim-markdown-toc.
            },

            -- Set auto_update=true to use the following defaults.
            -- Set to false to disable completely.
            -- Fields events and pattern are used unprocessed for creating autocmds.
            auto_update = {
                enabled = true,
                -- This allows the ToC to be refreshed silently on save for any markdown file.
                -- The refresh operation uses `Mtoc update` and does NOT create the ToC if
                -- it does not exist.
                events = { "BufWritePre" },
                pattern = "*.{md,mdown,mkd,mkdn,markdown,mdwn,mdx}",
            },
        },
    },
}
