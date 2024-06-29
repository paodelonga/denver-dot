--[[ Docstring

    Show ip addresses on wibar

    (c) Copyright 2023, Abiel Mendes (<https://github.com/paodelonga>)

--]]

-- widgets.Whoip

local async = require("lain.helpers").async
local newtimer = require("lain.helpers").newtimer
local wibox = require("wibox")
local fontfg = require("lain").util.markup.fontfg

local function Widget(arguments)
    local Whoip = {
        widget = wibox.widget({
            layout = wibox.layout.align.horizontal,
            {
                id = "wtextbox",
                widget = wibox.widget.textbox,
            },
        }),
    }

    local args = arguments or {}
    local timeout = args.timeout or 1800
    local font = args.font or { name = "Noto Mono 9", color = "#FAFAFA" }
    local command = "hostname -i"

    local function checkAddresses()
        async(command, function(stdout)
            Whoip.widget:get_children_by_id("wtextbox")[1]:set_markup(
                fontfg(
                    font.name,
                    font.color,
                    stdout
                )
            )
        end)
    end

    Whoip.widget:connect_signal("button::press", function(_, _, _, button)
        if button == 1 then
            checkAddresses()
        end
    end)

    newtimer("awesome-widgets.whoip", timeout, checkAddresses)
    return Whoip.widget
end

return Widget

--[>D]
