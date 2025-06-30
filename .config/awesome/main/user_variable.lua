local _M = {
terminal = "alacritty",
editor = os.getenv("EDITOR") or "vim",
--editor_cmd = terminal .. " -e " .. editor,
modkey = "Mod4",
}
return _M
