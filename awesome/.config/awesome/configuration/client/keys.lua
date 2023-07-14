local awful = require('awful')
local gears = require('gears')

require('awful.autofocus')
local modkey = require('configuration.keys.mod').modKey
local meta = modkey
local altkey = require('configuration.keys.mod').altKey
local wh = require("helpers.window_helper")

clientKeys = gears.table.join(
    awful.key({ modkey, }, "g",
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = "toggle fullscreen", group = "client" }),
    awful.key({ modkey }, "q", function(c) c:kill() end,
        { description = "close", group = "client" }),
    awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle,
        { description = "toggle floating", group = "client" }),
    --awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
    --{ description = "move to master", group = "client" }),
    awful.key({ modkey, }, "o", function(c) c:move_to_screen() end,
        { description = "move to screen", group = "client" }),
    awful.key({ modkey, }, "t", function(c) c.ontop = not c.ontop end,
        { description = "toggle keep on top", group = "client" }),
    awful.key({ modkey, }, "n",
        function(c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end,
        { description = "minimize", group = "client" }),
    awful.key({ modkey, }, "m",
        function(c)
            c.maximized = not c.maximized
            c:raise()
        end,
        { description = "(un)maximize", group = "client" }),
    awful.key({ modkey, "Control" }, "m",
        function(c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end,
        { description = "(un)maximize vertically", group = "client" }),
    awful.key({ modkey, "Shift" }, "m",
        function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end,
        { description = "(un)maximize horizontally", group = "client" }),

    -- Top panel toggling
    awful.key({ modkey, }, "b",
        function()
            wh.toggle_wibar()
        end,
        { description = "toggle top panel visibility of current screen", group = "client" }),
    awful.key({ modkey, "Shift" }, "b",
        function()
            wh.toggle_all_wibars()
        end,
        { description = "toggle all top panel visibility", group = "client" }),

    awful.key({ meta, "Shift" }, "Left",
        function()
            -- get current tag
            local t = client.focus and client.focus.first_tag or nil
            if t == nil then
                return
            end
            -- get previous tag (modulo 9 excluding 0 to wrap from 1 to 9)
            local tag = client.focus.screen.tags[(t.index - 2) % 9 + 1]
            awful.client.movetotag(tag)
            awful.tag.viewprev()
        end,
        { description = "move client to previous tag and switch to it", group = "tag" }),
    awful.key({ meta, "Shift" }, "Right",
        function()
            -- get current tag
            local t = client.focus and client.focus.first_tag or nil
            if t == nil then
                return
            end
            -- get next tag (modulo 9 excluding 0 to wrap from 9 to 1)
            local tag = client.focus.screen.tags[(t.index % 9) + 1]
            awful.client.movetotag(tag)
            awful.tag.viewnext()
        end,
        { description = "move client to next tag and switch to it", group = "tag" }),
    awful.key({ meta, }, "Escape", awful.tag.history.restore,
        { description = "go back", group = "tag" }),

    -- Directional window focusing
    awful.key({ meta, }, "j", function() wh.focus_window("down", -1) end,
        { description = "focus down by direction", group = "client" }
    ),
    awful.key({ meta, }, "k", function() wh.focus_window("up", 1) end,
        { description = "focus up by direction", group = "client" }
    ),
    awful.key({ meta, }, "h", function() wh.focus_window("left", -1) end,
        { description = "focus left by direction", group = "client" }
    ),
    awful.key({ meta, }, "l", function() wh.focus_window("right", 1) end,
        { description = "focus right by direction", group = "client" }
    ),
    awful.key({ meta, }, "w", function() mymainmenu:show() end,
        { description = "show main menu", group = "awesome" }),

    -- Layout manipulation
    awful.key({ meta, "Shift" }, "j", function() awful.client.swap.bydirection("down") end,
        { description = "swap with client below", group = "client" }),
    awful.key({ meta, "Shift" }, "k", function() awful.client.swap.bydirection("up") end,
        { description = "swap with client above", group = "client" }),
    awful.key({ meta, "Shift" }, "h",
        function()
            awful.client.swap.bydirection("left")
            --awful.tag.incnmaster(1, nil, true)
        end,
        { description = "swap with client to the left", group = "client" }),
    awful.key({ meta, "Shift" }, "l",
        function()
            awful.client.swap.bydirection("right")
            --awful.tag.incnmaster(-1, nil, true)
        end,
        { description = "swap with client to the right", group = "client" }),

    -- Control number of Master clients
    awful.key({ "Control", meta }, "Return", function() awful.tag.incnmaster(1) end,
        { description = "Increase number of master clients", group = "client" }),
    awful.key({ "Shift", meta }, "Return", function() awful.tag.incnmaster(-1) end,
        { description = "Decrease number of master clients", group = "client" }),

    -- Screen focusing
    awful.key({ meta, "Control" }, "j", function() awful.screen.focus_relative(1) end,
        { description = "focus the next screen", group = "screen" }),
    awful.key({ meta, "Control" }, "k", function() awful.screen.focus_relative(-1) end,
        { description = "focus the previous screen", group = "screen" }),

    -- Jump to urgent client
    awful.key({ meta, "Control" }, "u", awful.client.urgent.jumpto,
        { description = "jump to urgent client", group = "client" }),
    awful.key({ meta, }, "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "go back", group = "client" }),

    -- Resize clients with directional keys
    awful.key({ meta, }, "Right", function() awful.tag.incmwfact(0.05) end,
        { description = "increase master width factor", group = "layout" }),
    awful.key({ meta, }, "Left", function() awful.tag.incmwfact(-0.05) end,
        { description = "decrease master width factor", group = "layout" }),
    awful.key({ meta, }, "Up", function() awful.client.incwfact(0.05) end,
        { description = "decrease window height factor", group = "layout" }),
    awful.key({ meta, }, "Down", function() awful.client.incwfact(-0.05) end,
        { description = "increase window height factor", group = "layout" }),
    awful.key({ meta, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end,
        { description = "increase the number of columns", group = "layout" }),
    awful.key({ meta, "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end,
        { description = "decrease the number of columns", group = "layout" }),
    awful.key({ meta, }, "space", function() awful.layout.inc(1) end,
        { description = "select next", group = "layout" }),
    awful.key({ meta, "Shift" }, "space", function() awful.layout.inc(-1) end,
        { description = "select previous", group = "layout" }),

    -- Minimizing clients
    awful.key({ meta, "Control" }, "n",
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", { raise = true }
                )
            end
        end,
        { description = "restore minimized", group = "client" })

)

return clientKeys
