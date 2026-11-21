-- ================================================================================================================== --
-- Plugins: UI

return {
    {
        name = "tab-bar",
        opts = {
            enable_tab_bar = true,
            use_fancy_tab_bar = true,
            hide_tab_bar_if_only_one_tab = false,
            tab_bar_at_bottom = false,
        },
    },
    {
        name = "window",
        opts = {
            window_padding = { left = 4, right = 4, top = 4, bottom = 4 },
            adjust_window_size_when_changing_font_size = false,
        },
    },
}

-- ================================================================================================================== --
