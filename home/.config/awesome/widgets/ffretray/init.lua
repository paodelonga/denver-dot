--[[

    FFmpeg screen recording status on tray

    (c) Copyright 2023, Abiel Mendes (<https://github.com/paodelonga>)
    https://github.com/paodelonga/awesome-wm-widgets

--]]

-- FFmpeg Screen Recording Status
-- widgets.ffretray

local naughty = require("naughty")
local async = require("lain.helpers").async
local newtimer = require("lain.helpers").newtimer
local wibox = require("wibox")
local fontfg = require("lain").util.markup.fontfg
local awful = require("awful")

local function Widget(arguments)
  local ffretray = {
    widget = wibox.widget({
      layout = wibox.layout.align.horizontal,
      {
        id = "wtextbox",
        widget = wibox.widget.textbox,
      }
    })
  }

  local args = arguments or {}
  -- define timeout after start recording
  timeout = 1
  local font = args.font or {
    name = "Noto Mono 9",
    color = "#FAFAFA"
  }

  local cmd = {
    get_pid = "bash -c 'pgrep -u $USER -x rec'",
    get_time = "bash -c 'ps -o etime -p $(pgrep -u $USER -x rec)'"
  }

  function ffretray.update()
    async(cmd.get_time, function(get_time_std)
      if string.find(get_time_std, "(%s.)(%d.*)") then
        rec_time = string.match(get_time_std, "([0-9]%p.*)")
        msg = string.format(" %s", rec_time)
      else
        msg = " "
      end
      ffretray.widget:get_children_by_id("wtextbox")[1]:set_markup(
        fontfg(
          font.name,
          font.color,
          msg
        )
      )
    end)
  end

  function ffretray.record()
    async(cmd.get_pid, function(get_pid_std)
      if string.find(get_pid_std, "%d.*") then
        local rec_pid = string.match(get_pid_std, "%d.*")
        awful.util.spawn("killall rec")
        awful.util.spawn("killall ffmpeg")
      else
        awful.util.spawn("rec")
      end
    end)
  end

  function ffretray.stop()
  end

  ffretray.widget:connect_signal("button::press", function(_, _, _, button)
      if button == 1 then -- Left Click
        ffretray.update()
      elseif button == 3 then -- Left Click
        ffretray.record()
        ffretray.update()
      end
  end)

  newtimer("widgets.ffretray", timeout, ffretray.update)
  return ffretray
end

return Widget
