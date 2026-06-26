return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "terraform", "hcl" })
            vim.treesitter.language.register("opentofu", "hcl")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                tofu_ls = {},
            },
        },
    },
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = { "tofu-ls" },
        },
    },
}
