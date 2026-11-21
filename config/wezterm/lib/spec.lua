local wezterm = require("wezterm")
local merge = require("lib.merge")
local Modules = require("lib.modules")

-- ================================================================================================================== --
-- Types

--- A plugin spec, shaped like a lazy.nvim spec.
--- @class Spec
--- @field [1]? string URL of a remote WezTerm plugin
--- @field name? string Label shown in log messages
--- @field enabled? boolean Set to `false` to skip this spec
--- @field opts? table Options merged into the config, or passed to the remote plugin
--- @field config? fun(plugin: table?, config: table, opts: table) Custom setup that replaces the default

-- ================================================================================================================== --
-- Helpers

--- A spec file can return one spec or a list of specs. Always hand back a list.
--- @param exports Spec|Spec[]
--- @return Spec[]
local function as_spec_list(exports)
    if type(exports[1]) == "table" then
        return exports
    end
    return { exports }
end

-- ================================================================================================================== --
-- Loading

local Specs = {}

--- Apply one spec to the config.
--- Uses the spec's own `config` function if it has one, otherwise the remote plugin's `apply_to_config`,
--- otherwise merges `opts` straight into the config.
--- @param config table
--- @param spec Spec
--- @param source string Module name shown in log messages
function Specs.load(config, spec, source)
    if spec.enabled == false then
        return
    end

    local opts = spec.opts or {}
    local plugin = spec[1] and wezterm.plugin.require(spec[1])

    if spec.config then
        spec.config(plugin, config, opts)
    elseif plugin then
        plugin.apply_to_config(config, opts)
    else
        merge(config, opts, spec.name or source)
    end
end

--- Load every spec from every file in `dir`.
--- @param config table
--- @param dir string
function Specs.import(config, dir)
    for _, module in ipairs(Modules.require_all(dir)) do
        for _, spec in ipairs(as_spec_list(module.exports)) do
            Specs.load(config, spec, module.name)
        end
    end
end

-- ================================================================================================================== --
-- Return Value

return Specs

-- ================================================================================================================== --
