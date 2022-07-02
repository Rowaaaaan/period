local awful = require('awful')
local gears = require("gears")
local menubar = require("menubar")

require('awful.autofocus')
local beautiful = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local meta = require('configuration.keys.mod').modKey
local alt = require('configuration.keys.mod').altKey
local ctrl = require('configuration.keys.mod').ctrlKey
local shift = require('configuration.keys.mod').shiftKey
local apps = require('configuration.apps')

-- {{{ Key bindings
globalKeys = gears.table.join(

	awful.key({ alt }, "space",
		function ()
			awful.spawn(apps.launcher, beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus, beautiful.fg_focus)
		end,
		{description = "Rofi launcher", group = "launcher"}
		),

	awful.key({ meta , alt }, "l",
		function ()
			awful.spawn(apps.scrlocker)
		end,
		{description = "Lock screen", group = "Session"}
		),

	awful.key({ meta }, "c",
		function ()
			awful.spawn(apps.calculator, beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus, beautiful.fg_focus)
		end,
		{description = "Rofi Calc", group = "launcher"}
		),
	awful.key({meta}, "x",
		function () awful.spawn("copyq toggle") end,
		{description = "Toggle Copyq", group = "launcher"}
			),

	awful.key({ meta }, "e",
		function ()
			awful.spawn(apps.term_explorer_cmd, beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus, beautiful.fg_focus)
		end,
		{description = "Spawn terminal explorer", group = "launcher"}
		),

	awful.key({ meta, shift }, "e",
		function ()
			awful.spawn(apps.explorer, beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus, beautiful.fg_focus)
		end,
		{description = "Spawn terminal explorer", group = "launcher"}
		),

	-- Toggle system tray
	--awful.key({ modKey }, "=",
	--function()
	--awful.screen.focused().systray.visible = not awful.screen.focused().systray.visible
	--end,
	--{description = "Toggle systray", group = "hotkeys"}
	--),

	-- screenshots
	awful.key({ }, "Print", function () awful.util.spawn("flameshot gui") end,
		{description = "Flameshot", group = "screenshots"}),
	awful.key({ "Shift" }, "Print", function () os.execute("flameshot full -p ~/Pictures/Screenshots") end,
		{description = "Flameshot full ~/Pictures/Screenshots", group = "screenshots"}),

    -- Brightness
    awful.key({ }, "XF86MonBrightnessUp", function () os.execute("light -A 10") end,
              {description = "+10%", group = "hotkeys"}),
    awful.key({ }, "XF86MonBrightnessDown", function () os.execute("light -U 10") end,
              {description = "-10%", group = "hotkeys"}),

    -- ALSA volume control
    --awful.key({ ctrl }, "Up",
    awful.key({ }, "XF86AudioRaiseVolume",
        function ()
            os.execute("pamixer --increase 5")
        end),
    --awful.key({ ctrl }, "Down",
    awful.key({ }, "XF86AudioLowerVolume",
        function ()
            os.execute("pamixer --decrease 5")
        end),
    awful.key({ }, "XF86AudioMute",
        function ()
            os.execute("pamixer --toggle-mute")
        end),
    awful.key({ ctrl, "Shift" }, "m",
        function ()
            os.execute("pamixer -set-volume 100")
        end),
    awful.key({ ctrl, "Shift" }, "0",
        function ()
            os.execute("pamixer -set-volume 0")
        end),

	awful.key({ meta, alt }, "h",      hotkeys_popup.show_help,
		{description = "show help", group="awesome"}),
	awful.key({ meta,           }, "Left",   awful.tag.viewprev,
		{description = "view previous", group = "tag"}),
	awful.key({ meta,           }, "Right",  awful.tag.viewnext,
		{description = "view next", group = "tag"}),

	awful.key({ meta, "Shift" }, "Left",
		function ()
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
		{description = "move client to previous tag and switch to it", group = "tag"}),

	awful.key({ meta, "Shift" }, "Right",
		function ()
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
		{description = "move client to next tag and switch to it", group = "tag"}),

	awful.key({ meta,           }, "Escape", awful.tag.history.restore,
		{description = "go back", group = "tag"}),

	awful.key({ meta,           }, "j",
		function ()
			awful.client.focus.byidx(-1)
		end,
		{description = "focus next by index", group = "client"}
		),
	awful.key({ meta,           }, "k",
		function ()
			awful.client.focus.byidx( 1)
		end,
		{description = "focus previous by index", group = "client"}
		),
	awful.key({ meta,           }, "w", function () mymainmenu:show() end,
		{description = "show main menu", group = "awesome"}),

	-- Layout manipulation
	awful.key({ meta, "Shift"   }, "j", function () awful.client.swap.byidx( -1)    end,
		{description = "swap with next client by index", group = "client"}),
	awful.key({ meta, "Shift"   }, "k", function () awful.client.swap.byidx(  1)    end,
		{description = "swap with previous client by index", group = "client"}),
	awful.key({ meta, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
		{description = "focus the next screen", group = "screen"}),
	awful.key({ meta, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
		{description = "focus the previous screen", group = "screen"}),
	awful.key({ meta,           }, "u", awful.client.urgent.jumpto,
		{description = "jump to urgent client", group = "client"}),
	awful.key({ meta,           }, "Tab",
		function ()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end,
		{description = "go back", group = "client"}),

	-- Standard program
	awful.key({ meta,           }, "Return", function () awful.spawn(apps.terminal) end,
		{description = "open a terminal", group = "launcher"}),
	awful.key({ meta, "Control" }, "r", awesome.restart,
		{description = "reload awesome", group = "awesome"}),
	awful.key({ meta, "Shift"   }, "e", awesome.quit,
		{description = "quit awesome", group = "awesome"}),

	awful.key({ meta,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
		{description = "increase master width factor", group = "layout"}),
	awful.key({ meta,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
		{description = "decrease master width factor", group = "layout"}),
	awful.key({ meta, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
		{description = "increase the number of master clients", group = "layout"}),
	awful.key({ meta, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
		{description = "decrease the number of master clients", group = "layout"}),
	awful.key({ meta, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
		{description = "increase the number of columns", group = "layout"}),
	awful.key({ meta, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
		{description = "decrease the number of columns", group = "layout"}),
	awful.key({ meta,           }, "space", function () awful.layout.inc( 1)                end,
		{description = "select next", group = "layout"}),
	awful.key({ meta, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
		{description = "select previous", group = "layout"}),

	awful.key({ meta, "Control" }, "n",
		function ()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal(
					"request::activate", "key.unminimize", {raise = true}
					)
			end
		end,
		{description = "restore minimized", group = "client"}),

	-- Prompt
	awful.key({ meta },            "r",     function () awful.screen.focused().mypromptbox:run() end,
		{description = "run prompt", group = "launcher"})

	--awful.key({ meta }, "x",
		--function ()
			--awful.prompt.run {
				--prompt       = "Run Lua code: ",
				--textbox      = awful.screen.focused().mypromptbox.widget,
				--exe_callback = awful.util.eval,
				--history_path = awful.util.get_cache_dir() .. "/history_eval"
			--}
		--end,
		--{description = "lua execute prompt", group = "awesome"})
	-- Menubar
	--awful.key({ meta }, "d", function() menubar.show() end,
		--{description = "show the menubar", group = "launcher"})
	)

keygroup = {'a', 's', 'd', 'f', 'u', 'i', 'o', 'p'}
for i = 1, 8 do
	-- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
	local descr_view, descr_toggle, descr_move, descr_toggle_focus
	if i == 1 or i == 8 then
		descr_view = {description = 'view tag #', group = 'tag'}
		descr_toggle = {description = 'toggle tag #', group = 'tag'}
		descr_move = {description = 'move focused client to tag #', group = 'tag'}
		descr_toggle_focus = {description = 'toggle focused client on tag #', group = 'tag'}
	end
	globalKeys =
	awful.util.table.join(
		globalKeys,
		-- View tag only.
		awful.key(
			{meta},
			keygroup[i],
			function()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					tag:view_only()
				end
			end,
			descr_view
			),
		-- Toggle tag display.
		awful.key(
			{meta, 'Control'},
			keygroup[i],
			function()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					awful.tag.viewtoggle(tag)
				end
			end,
			descr_toggle
			),
		-- Move client to tag.
		awful.key(
			{meta, 'Shift'},
			keygroup[i],
			function()
				if _G.client.focus then
					local tag = _G.client.focus.screen.tags[i]
					if tag then
						_G.client.focus:move_to_tag(tag)
					end
				end
			end,
			descr_move
			),
		-- Toggle tag on focused client.
		awful.key(
			{meta, 'Control', 'Shift'},
			keygroup[i],
			function()
				if _G.client.focus then
					local tag = _G.client.focus.screen.tags[i]
					if tag then
						_G.client.focus:toggle_tag(tag)
					end
				end
			end,
			descr_toggle_focus
			)
		)
end

return globalKeys
