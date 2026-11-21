local wezterm = require("wezterm")

-- ================================================================================================================== --
-- Types

--- A module loaded from a config folder.
--- @class LoadedModule
--- @field name string The name passed to `require()`, e.g. `plugins.ui`
--- @field exports any Whatever the file returned

-- ================================================================================================================== --
-- Helpers

--- Turn a file path into the name `require()` expects.
--- e.g. `<config_dir>/plugins/ui.lua` in folder `plugins` becomes `plugins.ui`.
--- @param dir string
--- @param path string
--- @return string
local function module_name(dir, path)
    local prefix = dir:gsub("/", ".")
    local file = path:match("([^/]+)%.lua$")
    return prefix .. "." .. file
end

-- ================================================================================================================== --
-- Modules

local Modules = {}

--- Require every `.lua` file directly inside `dir`, relative to the WezTerm config folder.
--- @param dir string
--- @return LoadedModule[]
function Modules.require_all(dir)
    local loaded = {}
    for _, path in ipairs(wezterm.glob(wezterm.config_dir .. "/" .. dir .. "/*.lua")) do
        local name = module_name(dir, path)
        table.insert(loaded, { name = name, exports = require(name) })
    end
    return loaded
end

-- ================================================================================================================== --
-- Return Value

return Modules

-- ================================================================================================================== --
