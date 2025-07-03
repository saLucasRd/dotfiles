-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
require("collision")()
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

require("main.error")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- This is used later as the default terminal and editor to run.

local layout = require("main.layout")
awful.layout.layouts = layout

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

require("apperance.wibox")

local globalbuttons = require("key.globalbuttons")
local globalkeys = require("key.globalkey")

--root.buttons(globalbuttons)
root.keys(globalkeys)

local myrules = require("main.rule")

awful.rules.rules = myrules

require("main.signal")

-- Gaps
beautiful.useless_gap = 5

-- Autostart
awful.spawn.once("picom --config ~/.config/picom/picom.conf")
awful.spawn.once("nitrogen --restore &")
awful.spawn.once("nvidia-settings --config home/interloper/.nvdia-settings-rc --load-config-only")
awful.spawn.once("nm-applet &")
awful.spawn.once("syncthing &")