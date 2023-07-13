local awful = require("awful")
local focus = require("awful.client.focus")

local helpers = {}

function helpers.focus_window(direction, idx)
    local c = client.focus
    -- Behave the same way hyprland does with maximized windows
    -- If the window is maximized, just iterate through the clients
    -- by id.
    if c.maximized then
        idx = idx or 1
        focus.byidx(idx)
        c.maximized = not c.maximized
        c = client.focus
        c.maximized = true
        c:raise()
        -- Otherwise, focus clients by direction
    else
        focus.bydirection(direction)
    end
end

return helpers
