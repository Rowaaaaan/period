local awful = require('awful')
local gears = require("gears")
local naughty = require('naughty')
local menubar = require("menubar")
local bw = require('awesome-wm-widgets.brightness-widget.brightness')

require('awful.autofocus')
local beautiful = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local wh = require('helpers.window_helper')

local meta = require('configuration.keys.mod').modKey
local alt = require('configuration.keys.mod').altKey
local ctrl = require('configuration.keys.mod').ctrlKey
local shift = require('configuration.keys.mod').shiftKey
local apps = require('configuration.apps')

-- {{{ Key bindings
globalKeys = gears.table.join(

	awful.key({ alt }, "space",
		function()
			awful.spawn(apps.launcher, beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus,
				beautiful.fg_focus)
		end,
		{ description = "Rofi launcher", group = "launcher" }
	),

	awful.key({ meta, alt }, "l", function() awful.spawn.with_shell(apps.scrlocker) end,
		{ description = "Lock screen", group = "Session" }
	),

	awful.key({ meta }, "c",
		function()
			awful.spawn(apps.calculator, beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus,
				beautiful.fg_focus)
		end,
		{ description = "Rofi Calc", group = "launcher" }
	),
	awful.key({ meta }, "x", function() awful.spawn("copyq toggle") end,
		{ description = "Toggle Copyq", group = "launcher" }
	),

	awful.key({ meta }, "e",
		function()
			awful.spawn.with_shell(apps.explorer, beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus,
				beautiful.fg_focus)
		end,
		{ description = "Spawn GUI file manager", group = "launcher" }
	),

	awful.key({ meta, shift }, "e",
		function()
			awful.spawn.with_shell(apps.term_explorer_cmd, beautiful.bg_normal, beautiful.fg_normal,
				beautiful.bg_focus, beautiful.fg_focus)
		end,
		{ description = "Spawn terminal explorer", group = "launcher" }
	),

	-- Open scratch Window
	awful.key({ meta, shift }, "x",
		function()
			awful.spawn.with_shell(apps.scratch, beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus,
				beautiful.fg_focus)
		end,
		{ description = "Spawn terminal explorer", group = "launcher" }
	),

	-- Toggle system tray
	--awful.key({ modKey }, "=",
	--function()
	--awful.screen.focused().systray.visible = not awful.screen.focused().systray.visible
	--end,
	--{ description = "Toggle systray", group = "hotkeys" }
	--),

	-- screenshots
	awful.key({}, "Print", function() awful.util.spawn("flameshot gui") end,
		{ description = "Flameshot", group = "screenshots" }),
	awful.key({ "Shift" }, "Print", function() os.execute("flameshot full -p ~/Pictures/Screenshots") end,
		{ description = "Flameshot full ~/Pictures/Screenshots", group = "screenshots" }),

	-- Brightness
	awful.key({}, "XF86MonBrightnessUp", function()
			bw:inc()
		end,
		{ description = "+10%", group = "hotkeys" }),
	awful.key({}, "XF86MonBrightnessDown", function()
			bw:dec()
		end,
		{ description = "-10%", group = "hotkeys" }),

	-- ALSA volume control
	--awful.key({ ctrl }, "Up",
	awful.key({}, "XF86AudioRaiseVolume", function()
		os.execute("pamixer --increase 5")
	end),
	--awful.key({ ctrl }, "Down",
	awful.key({}, "XF86AudioLowerVolume",
		function()
			os.execute("pamixer --decrease 5")
		end),
	awful.key({}, "XF86AudioMute",
		function()
			os.execute("pamixer --toggle-mute")
		end),
	awful.key({ ctrl, "Shift" }, "m",
		function()
			os.execute("pamixer -set-volume 100")
		end),
	awful.key({ ctrl, "Shift" }, "0",
		function()
			os.execute("pamixer -set-volume 0")
		end),

	awful.key({ meta, alt }, "h", hotkeys_popup.show_help,
		{ description = "show help", group = "awesome" }),

	-- Standard program
	awful.key({ meta, }, "Return", function() awful.spawn(apps.terminal) end,
		{ description = "open a terminal", group = "launcher" }),
	awful.key({ meta, "Control" }, "r", awesome.restart,
		{ description = "reload awesome", group = "awesome" }),
	awful.key({ meta, "Shift" }, "q", awesome.quit,
		{ description = "quit awesome", group = "awesome" }),

	-- Prompt
	awful.key({ meta }, "r", function() awful.screen.focused().mypromptbox:run() end,
		{ description = "run prompt", group = "launcher" }),

	awful.key({ meta, alt }, "x",
		function()
			awful.prompt.run {
				prompt       = "Run Lua code: ",
				textbox      = awful.screen.focused().mypromptbox.widget,
				exe_callback = awful.util.eval,
				history_path = awful.util.get_cache_dir() .. "/history_eval"
			}
		end,
		{ description = "lua execute prompt", group = "awesome" })
-- Menubar
--awful.key({ meta }, "d", function() menubar.show() end,
--{description = "show the menubar", group = "launcher"})
)

keygroup = { 'a', 's', 'd', 'f', 'u', 'i', 'o', 'p' }
for i = 1, 8 do
	-- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
	local descr_view, descr_toggle, descr_move, descr_toggle_focus
	if i == 1 or i == 8 then
		descr_view = { description = 'view tag #', group = 'tag' }
		descr_toggle = { description = 'toggle tag #', group = 'tag' }
		descr_move = { description = 'move focused client to tag #', group = 'tag' }
		descr_toggle_focus = { description = 'toggle focused client on tag #', group = 'tag' }
	end
	globalKeys =
		awful.util.table.join(
			globalKeys,
			-- View tag only.
			awful.key(
				{ meta },
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
				{ meta, 'Control' },
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
				{ meta, 'Shift' },
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
				{ meta, 'Control', 'Shift' },
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
