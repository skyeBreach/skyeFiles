vim.filetype.add({
    pattern = {
        ["git%/config"] = "gitconfig",
        ["git%/ignore"] = "gitignore",

        ["%.gitflow"] = "gitconfig",
    },
})

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "git_config",
                "gitcommit",
                "git_rebase",
                "gitignore",
                "gitattributes",
            },
        },
    },
    {
        "petertriho/cmp-git",
        opts = {},
    },
    {
        "hrsh7th/nvim-cmp",
        optional = true,
        dependencies = {
            "petertriho/cmp-git",
        },

        ---@module 'cmp'
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            table.insert(opts.sources, { name = "git" })
        end,
    },
}
