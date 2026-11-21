local wezterm = require("wezterm")
local merge = require("lib.merge")
local Modules = require("lib.modules")
local Specs = require("lib.spec")

-- ================================================================================================================== --
-- Helpers

--- Load every file in `config/`.
--- Files that return a table are merged into the config. Files that return nothing, like `events.lua`, only run.
--- @param config table
local function load_config_dir(config)
    for _, module in ipairs(Modules.require_all("config")) do
        if type(module.exports) ~= "table" then
            goto eol
        end

        merge(config, module.exports, module.name)
        ::eol::
    end
end

--- Load the specs passed to `setup()`. An `{ import = "dir" }` entry loads every file in that folder.
--- @param config table
--- @param specs table[]
local function load_specs(config, specs)
    for _, item in ipairs(specs) do
        if item.import then
            Specs.import(config, item.import)
            goto eol
        end

        Specs.load(config, item, "wezterm.lua")
        ::eol::
    end
end

-- ================================================================================================================== --
-- Setup

local Loader = {}

--- Build the WezTerm config: every file in `config/` first, then the specs.
--- @param setup { spec: table[] }
--- @return table
function Loader.setup(setup)
    local config = wezterm.config_builder()
    load_config_dir(config)
    load_specs(config, setup.spec or {})
    return config
end

return Loader

-- ================================================================================================================== --
