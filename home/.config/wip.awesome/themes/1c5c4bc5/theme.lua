local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi
local markup = require("lain").util.markup
local widgets = require("widgets")
local config_dir = require("gears").filesystem.get_configuration_dir()
local theme_assets = require("beautiful.theme_assets")

local theme = {}
local colors = {}
theme.widgets = {}

-- Preferences
theme.name = "1c5c4bc5"
theme.path = config_dir .. "themes/" .. theme.name
theme.rounded_shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, dpi(0)) end
theme.useless_gap = dpi(8)
theme.wibar_gap = dpi(8)

-- Color Palette
colors.empty = "#00000000"
colors.opacity = "BF"

-- Font
theme.font = "CozetteHiDpi 11.5" -- uni 05_53 9
theme.font_color = "#969696"

-- Client
theme.border_width = dpi(4)
theme.border_normal = "#2E2E2E"
theme.border_focus = "#4D4D4D"

-- Bar
theme.bar_bg = "#1B1B1B" .. colors.opacity
theme.bar_bd_color = "#2E2E2E" .. colors.opacity
theme.bar_bd_width = dpi(4)

-- Taglist
theme.taglist_font = theme.font
theme.taglist_fg_focus = "#D8D8D8"
theme.taglist_fg_occupied = "#4D4D4D"
theme.taglist_fg_empty = "#232323"
theme.taglist_fg_urgent = "#7192A8"

-- Notification
theme.notification_bg = "#1B1B1B"
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
	bg = "#1B1B1B",
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

theme.widgets.volume = lain.widget.alsa({
	timeout = 10,
	settings = function()
		widget:buttons(awful.util.table.join(
			awful.button({}, 4, function()
				os.execute(string.format("pamixer --increase 1", theme.widgets.volume.channel))
				theme.widgets.volume.update()
			end),

			awful.button({}, 5, function()
				os.execute(string.format("pamixer --decrease 1", theme.widgets.volume.channel))
				theme.widgets.volume.update()
			end),

			awful.button({}, 1, function()
				if
					tonumber(volume_now.level) == 0
					or tonumber(volume_now.level) > 50 and tonumber(volume_now.level) < 100
				then
					os.execute(string.format("pamixer --set-volume 100", theme.widgets.volume.channel))
					theme.widgets.volume.update()
				elseif
					tonumber(volume_now.level) == 100
					or tonumber(volume_now.level) < 50 and tonumber(volume_now.level) > 0
				then
					os.execute(string.format("pamixer --set-volume 0", theme.widgets.volume.channel))
					theme.widgets.volume.update()
				end
			end)
		))
		widget:set_markup(
			markup.fontfg(
				theme.font, theme.font_color, "VOL " .. volume_now.level .. "%"
			)
		)
	end,
})

theme.widgets.cpu = lain.widget.cpu({
	timeout = 2,
	settings = function()
		widget:set_markup(
			markup.fontfg(
				theme.font, theme.font_color, "CPU " .. cpu_now.usage .. "%"
			)
		)
	end,
})

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
		theme.font, theme.font_color, "%A, %B %d, %Y"
	)
end)
theme.widgets.clock:connect_signal("mouse::leave", function()
	theme.widgets.clock.format = markup.fontfg(
		theme.font, theme.font_color, "%R:%S "
	)
end)

function theme.at_screen_connect(s)
	-- For all tags opening with primary layout
	awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

	-- Layoutbox widget
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(
		gears.table.join(
			awful.button({ }, 1, function () awful.layout.inc( 1) end),
			awful.button({ }, 3, function () awful.layout.inc(-1) end),
			awful.button({ }, 4, function () awful.layout.inc( 1) end),
			awful.button({ }, 5, function () awful.layout.inc(-1) end)
		)
	)
	-- Create a taglist widget
	s.taglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = awful.util.taglist_buttons,
	})

	-- Create new bar instance
	s.wibar = awful.wibar({
		screen = s,
		height = dpi(theme.wibar_gap * 3.5),
		width = dpi(s.geometry.width - ((theme.bar_bd_width * 2) + (theme.wibar_gap * 2))), -- or gapless * 4
		stretch = false,
		position = "top",
		align = "centered",
		bg = theme.bar_bg,
		border_width = theme.bar_bd_width,
		border_color = theme.bar_bd_color,
		shape = theme.rounded_shape,
	})

	-- Bar placemente
	awful.placement.top(s.wibar, {
		margins = {
			top = theme.wibar_gap
		},
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

			theme.widgets.cpu.widget,
			theme.separator_space,

			theme.widgets.volume.widget,
			theme.separator_space,
		},
	})
end

return theme

