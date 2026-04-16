return {
    {
        "taku25/UNL.nvim",
        build = "cargo build --release --manifest-path scanner/Cargo.toml",
        opts = {
            -- Configuration for UI backends
            ui = {
                picker = {
                    mode = "auto", -- "auto", "telescope", "fzf_lua", "native"
                    prefer = { "telescope", "fzf_lua", "native" },
                    behaviour = {
                        single = "native",
                        multiselect = "native",
                        multiselect_empty = "confirm_item",
                    },
                },
                filer = {
                    mode = "auto",
                    prefer = { "nvim-tree", "neo-tree", "native" },
                },
                progress = {
                    enable = true,
                    mode = "auto", -- "auto", "fidget", "window", "notify"
                    prefer = { "fidget", "window", "notify" },
                },
            },

            -- Configuration for logging
            logging = {
                level = "info", -- Global base log level (trace, debug, info, warn, error)
                echo = { level = "warn" }, -- Minimum level to display with :echo
                notify = { level = "error", prefix = "[UNL]" }, -- Minimum level and prefix for vim.notify
                file = { enable = true, max_kb = 512, rotate = 3, filename = "unl.log" }, -- File log settings
            },
        },
    },
}
