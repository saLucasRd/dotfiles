# dotfiles

dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Setup

```bash
chezmoi init https://github.com/saLucasRd/dotfiles.git
chezmoi apply
```

## Contents

| Config | Description |
|--------|-------------|
| **mango** | Wayland compositor config |
| **tmux** | Terminal multiplexer |
| **foot** | Wayland terminal emulator |
| **waybar** | Status bar |
| **oh-my-posh** | Shell prompt |
| **zsh** | Shell config — zinit, fzf, zoxide, syntax highlighting, autosuggestions |

## Dependencies

- [tpm](https://github.com/tmux-plugins/tpm) — tmux plugin manager
- [zinit](https://github.com/zdharma-continuum/zinit) — zsh plugin manager
- [oh-my-posh](https://ohmyposh.dev/) — prompt
- [fzf](https://github.com/junegunn/fzf) — fuzzy finder
- [zoxide](https://github.com/ajeetdsouza/zoxide) — smarter cd
- [eza](https://github.com/eza-community/eza) — modern `ls` replacement

## Chezmoi Workflow

```bash
# See pending changes
chezmoi diff

# Sync a file into chezmoi
chezmoi add ~/.config/tmux/tmux.conf

# Commit and push
chezmoi cd
git add .
git commit -m "message"
git push
```
