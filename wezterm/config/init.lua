local wezterm = require('wezterm')

-- ============================================================================================== --
-- Config: Definition

---@class Config
---@field options table
local Config = {}
Config.__index = Config

-- ============================================================================================== --
-- Config: Initialization and Construction

---Initialize the Config table
---@return Config
function Config:init()
    return setmetatable({ opts = {} }, self)
end

---Appends a table of unique opts to `Config.opts`, duplicates opts are skipped and logged as a
---warning.
---@param opts Table of new options to append
---@return Config
function Config:append(opts)
    for k,v in pairs(opts) do
        if self.opts[k] ~= nil then
            wezterm.log_warn(
                'Found Duplicate Config Option:',
                {
                    old = self.opts[k],
                    new = opts[k]
                }
            )
            goto continue
        end
        self.opts[k] = v
        ::continue::
    end
    return self
end

-- ============================================================================================== --
-- Config: Return Value

return Config

-- ============================================================================================== --
