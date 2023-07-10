local awful = require("awful")

local helpers = {}

function helpers.focus_window(direction)
    local c = client.focus
    if c.maximized then
        c.maximized = not c.maximized
    end
    awful.client.focus.bydirection(direction)
    c:raise()
end

return helpers
