vim.filetype.add({
    pattern = {
        ["mise%.lock"] = "toml",
        ["mise%..+%.lock"] = "toml",
        [".miserc.toml"] = "toml.tera",
    },
})

vim.treesitter.language.register("toml", "toml.tera")

return {
    {
        "carldaws/miser.nvim",
        config = function()
            require("miser").setup({

                auto_format = false, -- format on save (registry first, LSP fallback)
                auto_lsp = false, -- enable LSPs from mise tools
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        init = function()
            require("vim.treesitter.query").add_predicate("is-mise?", function(_, _, bufnr, _)
                local filepath = vim.fs.normalize(vim.api.nvim_buf_get_name(tonumber(bufnr) or 0))
                local filename = vim.fn.fnamemodify(filepath, ":t")
                return filename:match("^%.?mise.*%.toml$") ~= nil
                    or filepath:match("/%.?mise/config%.toml$") ~= nil
                    or filepath:match("/%.?mise/config%.local%.toml$") ~= nil
                    or filepath:match("/%.?mise/config%.[^/]+%.toml$") ~= nil
                    or filepath:match("/%.config/mise/mise%.toml$") ~= nil
                    or filepath:match("/%.config/mise/mise%.local%.toml$") ~= nil
                    or filepath:match("/%.?mise/conf%.d/[^/]+%.toml$") ~= nil
            end, { force = true, all = false })
        end,
    },
    {
        "jmbuhr/otter.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            vim.api.nvim_create_autocmd({ "FileType" }, {
                pattern = { "toml" },
                group = vim.api.nvim_create_augroup("EmbedToml", {}),
                callback = function()
                    require("otter").activate()
                end,
            })
        end,
    },
}
