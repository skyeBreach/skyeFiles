local wezterm = require("wezterm")

-- ================================================================================================================== --
-- Events: Config

wezterm.on("window-config-reloaded", function(window)
    window:toast_notification("wezterm", "Config reloaded", nil, 2000)
end)

-- ================================================================================================================== --
