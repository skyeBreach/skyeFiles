local wezterm = require("wezterm")

-- ================================================================================================================== --
-- Plugins: Font

return {
    name = "font",
    opts = {
        font = wezterm.font_with_fallback({
            { family = "FiraCode Nerd Font", weight = "Bold" },
            { family = "JetBrains Mono", weight = "Bold" },
        }),
        font_size = 10,
        harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
        warn_about_missing_glyphs = true,
    },
}

-- ================================================================================================================== --
