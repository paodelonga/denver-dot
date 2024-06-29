local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi
local markup = require("lain").util.markup
local widgets = require("widgets")
local config_dir = require("gears").filesystem.get_configuration_dir()

local theme = {}
local colors = {}
theme.widgets = {}

-- Preferences
theme.name = "a155aacf"
theme.path = config_dir .. "themes/" .. theme.name
theme.rounded_shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, dpi(0)) end
theme.useless_gap = dpi(3)
theme.wibar_thickness = dpi(5)

-- Color Palette
colors.opacity = "38"

-- Font
theme.font = "CozetteHiDpi 11.5"
theme.font_color = "#969696"

-- Client
theme.border_width = dpi(2)
theme.border_normal = "#2E2E2E"
theme.border_focus = "#5b768c"

-- Bar
theme.bar_bg = "#121212" .. colors.opacity
theme.bar_bd_color = "#2E2E2E" .. colors.opacity
theme.bar_bd_width = dpi(2)

-- Taglist
theme.taglist_font = theme.font
theme.taglist_fg_focus = "#D8D8D8"
theme.taglist_fg_occupied = "#4D4D4D"
theme.taglist_fg_empty = "#232323"
theme.taglist_fg_urgent = "#4D90C0"

-- -- Systray
-- theme.bg_systray = "#070707"
-- theme.systray_icon_spacing = 0

-- Notification
theme.notification_bg = "#121212"
theme.notification_fg = theme.font_color
theme.notification_border_color = "#4D4D4D"
theme.notification_shape = theme.rounded_shape
theme.notification_icon_size = dpi(60)

-- Layouts
theme.layout_max = theme.path .. "/layout/max.png"
theme.layout_tile = theme.path .. "/layout/tile.png"
theme.layout_tiletop = theme.path .. "/layout/tiletop.png"
theme.layout_floating = theme.path .. "/layout/floating.png"
theme.layout_termfair = theme.path .. "/layout/termfair.png"
theme.layout_tilebottom = theme.path .. "/layout/tilebottom.png"
theme.layout_magnifier = theme.path .. "/layout/magnifier.png"
theme.layout_centerwork = theme.path .. "/layout/centerwork.png"

-- Separators
theme.separator_space = wibox.widget.textbox(
	markup.fontfg(
		theme.font, theme.font_color, " "
	)
)

theme.separator_bar = wibox.widget.textbox(
	markup.fontfg(
		theme.font, theme.font_color, " | "
	)
)

-- Widgets
theme.widgets.hotkeys_popup = require("awful.hotkeys_popup").widget.new({
	width = dpi(1200),
	height = dpi(610),
	bg = "#121212",
	fg = "#969696",
	modifiers_fg = "#969696",
	font = theme.font,
	description_font = theme.font,
	border_width = theme.border_width,
	border_color = "#4D4D4D",
	shape = theme.rounded_shape,
	group_margin = dpi(20),
	merge_duplicates = true,
})

theme.widgets.spotify_bar = widgets.spotify_bar({
	timeout = 5,
	font = {
		name = theme.font,
		color = theme.font_color,
	},
})

theme.widgets.volume = widgets.pavol({
	font = {
		name = theme.font,
		color = theme.font_color,
	},
	parameters = {
		volume = "--allow-boost"
	}
})

theme.widgets.whoip = widgets.whoip({
	font = {
		name = theme.font,
		color = theme.font_color,
	},
})

-- theme.widgets.mem = lain.widget.mem({
-- 	timeout = 5,
-- 	settings = function()
-- 		widget:set_markup(
-- 			markup.fontfg(
-- 				theme.font, theme.font_color, "MEM " .. mem_now.used .. "MB"
-- 			)
-- 		)
-- 	end,
-- })

-- theme.widgets.cpu = lain.widget.cpu({
-- 	timeout = 5,
-- 	settings = function()
-- 		widget:set_markup(
-- 			markup.fontfg(
-- 				theme.font, theme.font_color, "CPU " .. cpu_now.usage .. "%"
-- 			)
-- 		)
-- 	end,
-- })

-- theme.widgets.systray = wibox.widget.systray({
-- 	opacity = 1,
-- })

theme.widgets.clock = wibox.widget({
	refresh = 1,
	format = markup.fontfg(
		theme.font, theme.font_color, "%R:%S"
	),
	widget = wibox.widget.textclock,
	font = theme.font,
})

theme.widgets.clock:connect_signal("mouse::enter", function()
	theme.widgets.clock.format = markup.fontfg(
		theme.font, theme.font_color, "%a %d, %b, %y"
	)
end)
theme.widgets.clock:connect_signal("mouse::leave", function()
	theme.widgets.clock.format = markup.fontfg(
		theme.font, theme.font_color, "%R:%S "
	)
end)

theme.widgets.xkb_indicator = widgets.xkb_indicator({
	font = {
		name = theme.font,
		color = theme.font_color,
	},
})

function theme.at_screen_connect(s)
	-- For all tags opening with primary layout
	awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

	-- Layoutbox widget
	s.mylayoutbox = awful.widget.layoutbox(s)

	-- Create a taglist widget
	s.taglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = awful.util.taglist_buttons,
	})

	-- Create new bar instance
	s.wibar = awful.wibar({
		screen = s,
		height = dpi(theme.wibar_thickness * 4.71),
		width = dpi(s.geometry.width - ((theme.bar_bd_width * 2) + (theme.useless_gap * 4))),
		stretch = false,
		position = "top",
		align = "centered",
		bg = theme.bar_bg,
		border_width = theme.bar_bd_width,
		border_color = theme.bar_bd_color,
		shape = theme.rounded_shape,
	})

	-- Bar widgets & setup
	s.wibar:setup({
		expand = "none",
		layout = wibox.layout.align.horizontal,
		{
			layout = wibox.layout.fixed.horizontal,
			s.mylayoutbox,
			s.taglist,
			theme.separator_space,
			theme.widgets.spotify_bar,
		},
		{
			layout = wibox.layout.fixed.horizontal,
			theme.widgets.clock,
			theme.separator_space
		},
		{
			layout = wibox.layout.fixed.horizontal,
			-- theme.widgets.systray,
			theme.separator_space,

			-- theme.widgets.mem.widget,
			-- theme.separator_space,

			-- theme.widgets.cpu.widget,
			-- theme.separator_space,

			theme.widgets.volume,
			theme.separator_space,

			theme.widgets.xkb_indicator.widget,
			theme.separator_space,

			theme.widgets.whoip,
			theme.separator_space
		},
	})
end

return theme

