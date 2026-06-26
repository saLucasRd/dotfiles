# dotfiles

Dotfiles managed with [chezmoi](https://www.chezmoi.io/) on Void Linux + Wayland.

Machines: `void-desktop` (Void Linux, NVIDIA), `void-thinkpad` (Void Linux, ThinkPad T480, Intel).  
Machine-specific config (GPU vars, monitors, nvibrant) handled via chezmoi templates.

> Future: Ansible playbook for full system bootstrap (packages + dotfiles).

---

## Bootstrap

```bash
# Install chezmoi
sudo xbps-install chezmoi

# Init from Codeberg
chezmoi init git@codeberg.org:saLucasRd/dotfiles.git
chezmoi apply
```

---

## Configs

| Config | Tool |
|--------|------|
| `mango` | Wayland compositor (wlroots) |
| `foot` | Terminal emulator |
| `tmux` | Terminal multiplexer |
| `zsh` | Shell — zinit, starship, fzf, zoxide |
| `noctalia` | Shell/bar/launcher (noctalia-shell) |
| `yazi` | File manager |
| `fastfetch` | System info |
| `starship` | Prompt (Kanagawa palette via noctalia) |

---

## Dependencies

Install before `chezmoi apply`:

```bash
sudo xbps-install chezmoi git xtools
```

> `xtools` provides helpers like `xlocate`, `xbps-query`, `xpkg` — useful for package management on Void.

### Shell
```bash
sudo xbps-install zsh starship fzf zoxide eza
```
- [zinit](https://github.com/zdharma-continuum/zinit) — installed automatically on first zsh launch

### Terminal / Multiplexer
```bash
sudo xbps-install foot tmux
```
- [tpm](https://github.com/tmux-plugins/tpm) — tmux plugin manager (install manually)

### Compositor & Wayland
```bash
sudo xbps-install mango dbus pipewire wireplumber grim slurp wl-clipboard satty
```
- `Print` — captura região → copia pra clipboard
- `Shift+Print` — captura região → abre satty para anotação
- [noctalia-shell](https://github.com/noctalia-dev/noctalia-shell) — bar, launcher, control center (install separately)
- [nvibrant](https://github.com/libvibrant/nvibrant) — NVIDIA saturation (`pipx install nvibrant`, **void-desktop only**)

### Apps
```bash
sudo xbps-install foot tmux neovim yazi keepassxc fastfetch
```
- [zen-browser](https://zen-browser.app) — browser (install via `/opt/zen-browser`)

### Audio
```bash
sudo xbps-install pipewire wireplumber
```

### Fonts
```bash
sudo xbps-install font-jetbrains-mono-nerd
```
---

## Theming
GTK theme, icons, and cursor are selected via [nwg-look](https://github.com/nwg-piotr/nwg-look) — it writes the `gtk-3.0`/`gtk-4.0` `settings.ini` files and symlinks the GTK4 assets into `~/.config/gtk-4.0/`.

| Type | Name | Source |
|------|------|--------|
| GTK | `Kanagawa-B-LB-Dark` | [Kanagawa GTK Theme](https://store.kde.org/p/1810560) |
| Icons | `Kanagawa` | [Kanagawa Icons Theme](https://store.kde.org/p/1810565) |
| Cursor | `vimix-kanagawa-cursors-lotus` | [Vimix-kanagawa-cursors](https://github.com/walldmtd/Vimix-kanagawa-cursors) |

Install GTK themes into `~/.local/share/themes`, icons + cursor into `~/.local/share/icons`, then select them in nwg-look.

---

## Chezmoi Workflow

`autoCommit = true` — every `chezmoi add` commits automatically.

```bash
# Sync file to chezmoi (auto-commits)
chezmoi add ~/.zshrc

# Sync all managed files that changed
chezmoi re-add

# Check pending diffs
chezmoi diff

# Push to Codeberg
chezmoi cd && git push

# On new machine after chezmoi apply
chezmoi init git@codeberg.org:saLucasRd/dotfiles.git
chezmoi apply
```

---

## Machine Templates

Files with machine-specific blocks: `.zprofile`, `.config/mango/config.conf`

| Variable | void-desktop | void-thinkpad |
|----------|-------------|---------------|
| GPU vars | NVIDIA (GBM, LIBVA, etc.) | — |
| nvibrant | yes | — |
| Monitors | DP-1 (144hz) + HDMI-A-1 (75hz) | eDP-1 (60hz) |
