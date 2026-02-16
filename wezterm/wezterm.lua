local wezterm = require("wezterm")

local Config = require("config"):init():append(require("config.theme"))

return Config.opts
