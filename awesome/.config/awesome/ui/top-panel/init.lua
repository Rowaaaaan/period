local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')

local configuration = require('configuration.config')
require('widgets.top-panel')

local mpris_widget = require("awesome-wm-widgets.mpris-widget")
local volume_widget = require("awesome-wm-widgets.pactl-widget.volume")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")
local battery_widget = require("awesome-wm-widgets.battery-widget.battery")
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")

local TopPanel = function(s)
	-- Wiboxes are much more flexible than wibars simply for the fact that there are no defaults, however if you'd rather have the ease of a wibar you can replace this with the original wibar code
	local panel =
		wibox(
			{
				ontop = true,
				screen = s,
				height = configuration.toppanel_height,
				width = s.geometry.width,
				x = s.geometry.x,
				y = s.geometry.y,
				stretch = false,
				bg = beautiful.background,
				fg = beautiful.fg_normal,
				struts = {
					top = configuration.toppanel_height
				}
			}
		)

	panel:struts(
		{
			top = configuration.toppanel_height
		}
	)
	--

	panel:setup {
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			--mylauncher,
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{       -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			mpris_widget(),
			ram_widget(),
			volume_widget { widget_type = 'arc' },
			brightness_widget({ program = 'xbacklight', tooltip = true, rmb_set_max = true }),
			mykeyboardlayout,
			battery_widget(),
			wibox.widget.systray(),
			mytextclock,
			s.mylayoutbox,
		},
	}

	local cw = calendar_widget({ placement = 'top_right', start_sunday = true })
	mytextclock:connect_signal("mouse::press",
		function(_, _, _, button)
			if button == 1 then cw.toggle() end
		end)

	local function rounded_shape(size)
		return function(cr, width, height)
			gears.shape.rounded_rect(cr, width, height, size)
		end
	end

	return panel
end

return TopPanel
