--[[ Docstring

    Control the volume throught pamixer

    (c) Copyright 2023, Abiel Mendes (<https://github.com/paodelonga>)
    https://github.com/paodelonga/awesome-widgets/tree/main/widgets/pavol

--]]

-- PulseAudio Volume
-- widgets.pavol

local async = require("lain.helpers").async
local newtimer = require("lain.helpers").newtimer
local wibox = require("wibox")
local fontfg = require("lain").util.markup.fontfg

local function Widget(arguments)
  local pavol = {
    widget = wibox.widget({
      layout = wibox.layout.align.horizontal,
      {
        id = "wtextbox",
        widget = wibox.widget.textbox,
      }
    })
  }

  local args = arguments or {}
  local bin = args.bin or "pamixer"
  local timeout = args.timeout or 5
  local font = args.font or {
    name = "Noto Mono 9",
    color = "#FAFAFA"
  }
  local parameters = args.parameters or {
    volume = {}
  }
  local cmd = {
    status = string.format("%s --get-mute --get-volume", bin),
    increase = string.format("%s --increase 1 %s", bin, parameters.volume),
    decrease = string.format("%s --decrease 1 %s", bin, parameters.volume),
    togglemute = string.format("%s --toggle-mute", bin),
  }

  local function update()
    async(cmd.status, function(stdout)
      if stdout ~= nil then
        local mute, volume = string.match(stdout, "(%a*)%s" .. "(%d*)")
        pavol.widget:get_children_by_id("wtextbox")[1]:set_markup(
          fontfg(font.name, font.color,
            (string.find(mute, "true") and
            "MUTED (" .. volume .. "%)" or
            "VOL " .. volume .. "%")
          )
        )
      end
    end)
  end

  function pavol.widget.increase()
    os.execute(cmd.increase)
    update()
  end

  function pavol.widget.decrease()
    os.execute(cmd.decrease)
    update()
  end

  function pavol.widget.toggle_mute()
    os.execute(cmd.togglemute)
    update()
  end

  pavol.widget:connect_signal("button::press", function(_, _, _, button)
      if button == 1 then -- Left Click
        pavol.widget.toggle_mute()
      elseif button == 4 then -- Scroll Up
        pavol.widget.increase()
      elseif button == 5 then -- Scroll Down
        pavol.widget.decrease()
      end
  end)

  newtimer("widgets.pavol", timeout, update)
  return pavol.widget
end

return Widget
