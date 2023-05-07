-- {{{ Boilerplate
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup")

if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end
-- }}}

-- {{{ Themeing
local theme = {}
theme.font          = "Gabriele Light Ribbon FG"
theme.bg_normal     = "#2e3440" --base00
theme.bg_minimize   = "#434c5e" --base02
theme.fg_normal     = "#8fbcbb" --base07
theme.useless_gap   = 3
theme.border_width  = 1
theme.border_normal = "#2e3440" --base00
theme.border_focus  = "#a3be8c" --base0D
theme.wallpaper     = "~/dotfiles/backgrounds/Bliss Calvin and Hobbes.png"
-- beautiful.init(theme)
-- }}}

-- {{{ Layouts
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.max}
-- }}}

-- {{{ Tags
awful.screen.connect_for_each_screen(function(s)
    awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])
    gears.wallpaper.maximized(beautiful.wallpaper, s, true) end)
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
    -- Group Awesome
    awful.key({ "Mod4",           }, "space",   hotkeys_popup.show_help, {description = "show keybindings", group = "awesome"}),
    awful.key({ "Mod4", "Control" }, "q",       awesome.quit,            {description = "quit awesome", group = "awesome"}),
    awful.key({ "Mod4", "Control" }, "r",       awesome.restart,         {description = "reload awesome", group = "awesome"}),
    awful.key({ "Mod4", "Control" }, "l",       function () awful.spawn.with_shell("brightnessctl set 0% && slock && brightnessctl set 100%") end, {description = "lock screen", group = "awesome"}),
    -- Group Launcher
    awful.key({ "Mod4"            }, "r",       function () awful.spawn("rofi -show drun") end, {description = "runlauncher", group = "launcher"}),
    awful.key({ "Mod4",           }, "Return",  function () awful.spawn("wezterm") end, {description = "launch terminal", group = "launcher"}),
    -- Group Layout
    awful.key({ "Mod4",           }, "l",       function () awful.tag.incmwfact( 0.05)          end, {description = "increase master size", group = "layout"}),
    awful.key({ "Mod4",           }, "h",       function () awful.tag.incmwfact(-0.05)          end, {description = "decrease master size", group = "layout"}),
    awful.key({ "Mod4",           }, "Tab",     function () awful.layout.inc( 1)                end, {description = "select next layout", group = "layout"}),
    -- Switch Windows
    awful.key({ "Mod4",           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ "Mod4",           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    -- Group Tag
    awful.key({ "Mod4"            }, "1",       function () awful.screen.focused().tags[1]:view_only() end, {description = "view tag 1", group = "tag"}),
    awful.key({ "Mod4"            }, "2",       function () awful.screen.focused().tags[2]:view_only() end, {description = "view tag 2", group = "tag"}),
    awful.key({ "Mod4"            }, "3",       function () awful.screen.focused().tags[3]:view_only() end, {description = "view tag 3", group = "tag"}),
    awful.key({ "Mod4"            }, "4",       function () awful.screen.focused().tags[4]:view_only() end, {description = "view tag 4", group = "tag"}),
    awful.key({ "Mod4"            }, "5",       function () awful.screen.focused().tags[5]:view_only() end, {description = "view tag 5", group = "tag"}),
    awful.key({ "Mod4", "Shift"   }, "1",       function () client.focus:move_to_tag(client.focus.screen.tags[1]) end, {description = "move focused client to tag 1", group = "tag"}),
    awful.key({ "Mod4", "Shift"   }, "2",       function () client.focus:move_to_tag(client.focus.screen.tags[2]) end, {description = "move focused client to tag 2", group = "tag"}),
    awful.key({ "Mod4", "Shift"   }, "3",       function () client.focus:move_to_tag(client.focus.screen.tags[3]) end, {description = "move focused client to tag 3", group = "tag"}),
    awful.key({ "Mod4", "Shift"   }, "4",       function () client.focus:move_to_tag(client.focus.screen.tags[4]) end, {description = "move focused client to tag 4", group = "tag"}),
    awful.key({ "Mod4", "Shift"   }, "5",       function () client.focus:move_to_tag(client.focus.screen.tags[5]) end, {description = "move focused client to tag 5", group = "tag"}))
-- Group Client
clientkeys = gears.table.join(
    awful.key({ "Mod4",           }, "w",       function (c) c:kill()                                   end, {description = "close", group = "client"}),
    awful.key({ "Mod4",           }, "f",       function (c) c.fullscreen = not c.fullscreen c:raise()  end, {description = "toggle fullscreen", group = "client"}),
    awful.key({ "Mod4",           }, "o",       function (c) c:move_to_screen()                         end, {description = "move to next screen", group = "client"}),
    awful.key({ "Mod4", "Shift"   }, "Space",   function () awful.client.swap.byidx(1)                  end, {description = "swap with next client by index", group = "client"}),
    awful.key({ "Mod4", "Shift"   }, "f",       awful.client.floating.toggle                               , {description = "toggle floating", group = "client"}),
    awful.key({ "Mod4", "Shift"   }, "o",       function () awful.screen.focus_relative( 1)             end, {description = "focus the next screen", group = "client"}))
-- applies to floating windows
clientbuttons = gears.table.join(
    awful.button({        }, 1, function (c) c:emit_signal("request::activate", "mouse_click", {raise = true}) end),
    awful.button({ "Mod4" }, 1, function (c) c:emit_signal("request::activate", "mouse_click", {raise = true}) awful.mouse.client.move(c) end),
    awful.button({ "Mod4" }, 3, function (c) c:emit_signal("request::activate", "mouse_click", {raise = true}) awful.mouse.client.resize(c) end))
root.keys(globalkeys)
-- }}}

-- {{{ Boilerplate so windows behave
awful.rules.rules = {{ rule = { },
                       properties = { border_width = beautiful.border_width,
                                      border_color = beautiful.border_normal,
                                      focus = awful.client.focus.filter,
                                      raise = true,
                                      size_hints_honor = false,
                                      keys = clientkeys,
                                      buttons = clientbuttons,
                                      screen = awful.screen.preferred,
                                      placement = awful.placement.no_overlap+awful.placement.no_offscreen}},
                    {  rule = { class = "Plank"},
                       properties = { ontop = true,
                                      focusable = false }}}
-- }}}

-- {{{ Follow Focus & Border Colors
client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- {{{ Autostart
awful.spawn.with_shell("command -v compton && compton")
-- }}}

-- {{{ Wallpaper
screen.connect_signal("request::wallpaper", function(s)
    local image  = gears.filesystem.get_random_file_from_dir(
        "~/extras/backgrounds/",
        {".jpg", ".png", ".svg"},
        true
    )
    -- beautiful.wallpaper = image

     awful.wallpaper {
        screen = s,
        bg     = "#0000ff",
        widget = {
            {
                image  = gears.filesystem.get_random_file_from_dir(
                    "~/extras/backgrounds/",
                    {".jpg", ".png", ".svg"},
                    true
                ),
                resize = true,
                widget = wibox.widget.imagebox,
            },
            valign = "center",
            halign = "center",
            tiled  = false,
            widget = wibox.container.tile,
        }
    }
end)

gears.timer {
    timeout   = 18,
    autostart = true,
    callback  = function()
        for s in screen do
            s:emit_signal("request::wallpaper")
        end
    end,
}
-- }}}
