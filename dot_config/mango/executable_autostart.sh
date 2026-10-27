#!/bin/sh
# Mango autostart

# D-Bus-activated services
dbus-update-activation-environment \
  WAYLAND_DISPLAY DISPLAY \
  XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE

# audio (pipewire first, then the rest)
pipewire >/dev/null 2>&1 &
sleep 1
pipewire-pulse >/dev/null 2>&1 &
wireplumber >/dev/null 2>&1 &

# ssh agent
~/.config/mango/start-ssh-agent.sh >/dev/null 2>&1 &

# shell
noctalia >/dev/null 2>&1 &

# NVIDIA-only tweak (desktop)
if [ "$(hostname)" = "void-desktop" ]; then
  ~/.local/bin/nvibrant 1023 1023 >/dev/null 2>&1 &
fi
