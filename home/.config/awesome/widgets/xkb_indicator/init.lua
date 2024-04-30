--[[ 

    Show or switch keyboard layouts through wibar

    (c) Copyright 2023, Abiel Mendes (<https://github.com/paodelonga>)
    https://github.com/paodelonga/awesome-wm-widgets

--]]

-- X Keyboard Layout Indicator
-- widgets.xkb_layout_indicator

local naughty = require("naughty")
local async = require("lain.helpers").async
local newtimer = require("lain.helpers").newtimer
local wibox = require("wibox")
local fontfg = require("lain").util.markup.fontfg

local function Widget(arguments)
  local xkb_layout_indicator = {
    widget = wibox.widget({
      layout = wibox.layout.align.horizontal,
      {
        id = "wtextbox",
        widget = wibox.widget.textbox,
      }
    })
  }

  local args = arguments or {}
  local bin = args.bin or "xkblayout-state"
  local timeout = args.timeout or 1800
  local font = args.font or {
    name = "Noto Mono 9",
    color = "#FAFAFA"
  }

  local cmd = {
    current_layout = string.format("%s print '%%s %%e'", bin),
    next_layout = string.format("%s set +1", bin),
    prev_layout = string.format("%s set -1", bin),
    default_layout = string.format("%s set 0", bin),
  }

  function xkb_layout_indicator.update()
    async(cmd.current_layout, function(stdout)
      if stdout ~= nil then 
        local symbol, variant = string.match(stdout, "(%a*)%s(%a*)")
        xkb_layout_indicator.widget:get_children_by_id("wtextbox")[1]:set_markup(
          fontfg(
            font.name,
            font.color,
            string.upper(string.format("%s(%s)", symbol, variant))
          )
        )
      end
    end)
  end

  function xkb_layout_indicator.next_layout()
    os.execute(cmd.next_layout)
    xkb_layout_indicator.update()
  end

  function xkb_layout_indicator.prev_layout()
    os.execute(cmd.prev_layout)
    xkb_layout_indicator.update()
  end

  function xkb_layout_indicator.default_layout()
    os.execute(cmd.default_layout)
    xkb_layout_indicator.update()
  end

  xkb_layout_indicator.widget:connect_signal("button::press", function(_, _, _, button)
      if button == 1 then -- Left Click
        xkb_layout_indicator.update()
      elseif button == 2 then -- Scroll Up
        xkb_layout_indicator.default_layout()
      elseif button == 4 then -- Scroll Up
        xkb_layout_indicator.next_layout()
      elseif button == 5 then -- Scroll Down
        xkb_layout_indicator.prev_layout()
      elseif button == 8 then -- Scroll Up
        xkb_layout_indicator.next_layout()
      elseif button == 9 then -- Scroll Down
        xkb_layout_indicator.prev_layout()
      end
  end)

  newtimer("widgets.xkb_layout_indicator", timeout, xkb_layout_indicator.update)
  return xkb_layout_indicator
end

return Widget
