local wezterm = require("wezterm")

-- ================================================================================================================== --
--  Helpers

--- @param value any
--- @return boolean
local function is_list(value)
    return type(value) == "table" and value[1] ~= nil
end

--- Return a new list with the items of `first`, then the items of `second`.
--- @param first any[]
--- @param second any[]
--- @return any[]
local function concat_lists(first, second)
    local combined = {}
    for _, item in ipairs(first) do
        table.insert(combined, item)
    end
    for _, item in ipairs(second) do
        table.insert(combined, item)
    end
    return combined
end

-- ================================================================================================================== --
-- Return Value

--- Merge `opts` into `config`.
--- New keys are added. Lists, like `keys`, are joined. Any other key that is already set is skipped and logged.
--- @param config table
--- @param opts table
--- @param source string Module name shown in the duplicate warning
return function(config, opts, source)
    for key, value in pairs(opts) do
        local current = config[key]
        if current == nil then
            config[key] = value
        elseif is_list(current) and is_list(value) then
            config[key] = concat_lists(current, value)
        else
            wezterm.log_warn(("%s: duplicate option '%s' skipped"):format(source, key))
        end
    end
end

-- ================================================================================================================== --
