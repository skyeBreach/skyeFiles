local wezterm = require("wezterm")

return {
    color_scheme = "Catppuccin Macchiato",
    font = wezterm.font_with_fallback({
        { family = "Fira Code Nerd Font", weight = "Bold" },
        { family = "JetBrains Mono", weight = "Bold" },
        { family = "SauceCodePro Nerd Font Mono", weight = "Bold" },
    }),
    font_size = 10,
    harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    term = "wezterm",
}
