vim.filetype.add({
    pattern = {
        [".*%.bazelrc"] = "bazelrc",
    },
})

return {
    {
        "alexander-born/bazel.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "starlark" } },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                starpls = {},
                bazelrc_lsp = {},
            },
        },
    },
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                "starpls",
                "bazelrc-lsp",
                "buildifier",
            },
        },
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                bzl = {
                    "buildifier",
                },
            },
        },
    },
}
