-- ================================================================================================================== --
-- Options

return {
    -- Terminal
    term = "wezterm",
    scrollback_lines = 10000,

    -- Bell
    audible_bell = "Disabled",

    -- Updates
    check_for_updates = false,
    automatically_reload_config = true,

    -- Debugging
    debug_key_events = os.getenv("WEZTERM_DEBUG") ~= nil,
}

-- ================================================================================================================== --
