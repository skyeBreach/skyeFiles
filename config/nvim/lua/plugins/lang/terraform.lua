return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "terraform", "hcl" })
            vim.list_extend(opts.ensure_installed, { "terragrunt", "hcl" })

            vim.treesitter.language.register("opentofu", "hcl")
            vim.treesitter.language.register("terragrunt", "hcl")
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
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                tf = { "tfmt" },
                terraform = { "tfmt" },
                hcl = { "tfmt" },
            },
            formatters = {
                tfmt = {
                    -- Specify the command and its arguments for formatting
                    command = "tofu",
                    args = { "fmt", "-" },
                    stdin = true,
                },
            },
        },
    },
}
