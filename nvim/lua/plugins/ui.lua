return {

    {
        "neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,
        opts = {
            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_gitignored = true,
                    hide_dotfiles = false,
                    hide_by_name = {
                        ".git",
                        "package-lock.json",
                    },
                    never_show = {},
                },
            },
        },
    },
}
