# Hyprdots 🌙

A minimalist, industrial, grayscale [Hyprland](https://hyprland.org) configuration.
Modular Lua-based config with a clean split between variables, window rules, and keybindings.

---

## ✨ Features

- **Modular Lua config** — categorized files under `hypr/cfg/` for easy maintenance.
- **Noctalia integration** — system UI, panel, and control center.
- **Scrolling layout** — Niri-like scrolling workspace paradigm via Hyprland's native scrolling layout.
- **Intelligent window rules** — auto-floating dialogs, focus-aware opacity, per-app rules.

---

## 🛠️ Dependencies

Install with your AUR helper (`paru` recommended). The bundled `install.fish` handles this automatically.

### Core (repo + AUR)

| Package | Source | Purpose |
|---------|--------|---------|
| `hyprland` | extra | Wayland compositor |
| `noctalia-git` | aur | System UI / control center |
| `snappy-switcher` | aur | Window/workspace switcher |
| `kitty` | extra | Terminal |
| `zen-browser` | extra | Browser |
| `zed` | extra | Editor (binary: `zeditor`) |
| `helix` | extra | Terminal editor |
| `fish` | extra | Shell |
| `starship` | extra | Shell prompt |
| `yazi` | extra | Terminal file manager |
| `btop` | extra | Resource monitor |
| `fastfetch` | extra | System info |
| `mpv` | extra | Media player |
| `aria2` | extra | Download utility |
| `yt-dlp` | extra | Media downloader |
| `spicetify-cli` | aur | Spotify theming |
| `grimblast-git` | aur | Screenshots |
| `tesseract` | extra | OCR engine |
| `wireplumber` | extra | Audio (provides `wpctl`) |
| `papirus-icon-theme` | extra | Icon theme |
| `bibata-cursor-theme-bin` | aur | Cursor theme (Bibata-Modern-Ice) |
| `noto-fonts`, `noto-fonts-cjk`, `noto-fonts-emoji` | extra | Fonts |
| `ttf-jetbrains-mono-nerd` | extra | Monospace font (Kitty/Starship) |

> Optional (not installed by default): `hayase` (anime torrent client, bound to `SUPER+H`).

---

## 🚀 Installation

Clone and run the installer. It installs dependencies via `paru`, symlinks every config into `~/.config`, and backs up any existing files.

```bash
git clone https://github.com/axioncs/hyprdots.git ~/.local/share/hyprdots
cd ~/.local/share/hyprdots
fish install.fish
```

To update later (pull + re-symlink):

```bash
fish install.fish --update
# or: fish install.fish -u
```

See `install.fish --help` for all flags.

---

## ⌨️ Keybindings

`SUPER` = mod key. `SUPER+ALT` = secondary mod.

### Applications

| Keybind | Action |
|---------|--------|
| `SUPER + T` | Terminal (Kitty) |
| `SUPER + E` | File Manager (Yazi) |
| `SUPER + W` | Browser (Zen) |
| `SUPER + C` | Editor (Zed) |
| `SUPER + H` | Hayase (optional, not a core dep) |
| `CTRL + SUPER + A` | Hypr-Lens |
| `CTRL + SUPER + Z` | Hypr-OCR |
| `ALT + A` | Trigger Aria (local AI assistant, if running) |

### Scratchpads (special workspaces)

| Keybind | Action |
|---------|--------|
| `SUPER + D` | Discord |
| `SUPER + ALT + D` | Equibop |
| `SUPER + S` | Spotify |
| `SUPER + SHIFT + S` | VPN |
| `SUPER + G` | Steam |
| `CTRL + SHIFT + Esc` | btop |
| `SUPER + SHIFT + Q` | qBittorrent |

### Window management

| Keybind | Action |
|---------|--------|
| `SUPER + Q` | Close window |
| `SUPER + ALT + Q` | Kill window |
| `SUPER + F` | Toggle fullscreen |
| `SUPER + ALT + F` | Toggle maximized |
| `SUPER + ALT + Space` | Toggle float |
| `SUPER + SHIFT + C` | Toggle group |
| `SUPER + ALT + C` | Column resize (0.5) |
| `SUPER + Z` / `SUPER + X` | Mouse drag / resize |
| `SUPER + mouse:274` | Close window (middle-click) |
| `SUPER + mouse:272` | Drag window (left-click) |
| `SUPER + mouse:273` | Resize window (right-click) |

### Workspaces & navigation

| Keybind | Action |
|---------|--------|
| `SUPER + [1-9]` | Focus workspace |
| `SUPER + ALT + [1-9]` | Move window to workspace |
| `SUPER + Wheel` / `SUPER + ALT + Wheel` | Cycle workspaces / move window |
| `SUPER + Arrows` | Focus direction |
| `SUPER + SHIFT + Arrows` | Move window direction |
| `SUPER + SHIFT + Wheel` | Focus left/right |
| `ALT + Tab` | Snappy switcher (MRU) |
| `SUPER + Tab` | Snappy switcher (workspace-filtered) |

### Layout utilities

| Keybind | Action |
|---------|--------|
| `SUPER + ALT + W` | Cycle layout (scrolling → dwindle → monocle → master) |
| `SUPER + ALT + P` | Pseudo-tile (dwindle) |
| `SUPER + ALT + T` | Toggle split (dwindle) |
| `SUPER + ALT + M` | Swap with master (master) |
| `SUPER + ALT + Down/Up` | Cycle next/prev (monocle) |

### Noctalia & UI

| Keybind | Action |
|---------|--------|
| `ALT + Space` | Launcher |
| `SUPER + I` | Settings |
| `SUPER + A` | Control center |
| `SUPER + SHIFT + A` | Control center (system) |
| `SUPER + SHIFT + W` | Wallhaven browser |
| `SUPER + N` | Control center (notifications) |
| `SUPER + ALT + V` | Control center (audio) |
| `SUPER + V` | Clipboard |
| `SUPER + R` | Reload config |
| `SUPER + SHIFT + X` | Lock session |
| `SUPER + ALT + X` | Session panel |

### Brightness / Media / Volume

| Keybind | Action |
|---------|--------|
| `XF86MonBrightnessUp/Down` | Brightness |
| `SUPER + CTRL + Space` / `XF86AudioPlay/Pause` | Media play/pause |
| `SUPER + CTRL + Equal/Minus` / `XF86AudioNext/Prev` | Media next/prev |
| `XF86AudioStop` | Media stop |
| `XF86AudioMute` / `SUPER + SHIFT + M` | Toggle mute |
| `XF86AudioMicMute` | Toggle mic mute |
| `XF86AudioRaise/LowerVolume` | Volume up/down |

### Screenshots & power

| Keybind | Action |
|---------|--------|
| `Print` | Screenshot (fullscreen) |
| `CTRL + Print` | Screenshot (region) |
| `SUPER + SHIFT + E` | Exit Hyprland |
| `SUPER + SHIFT + P` | DPMS off (after 500ms) |
| `SUPER + SHIFT + U` | Update dotfiles (`install.fish --update`) |

---

## 📁 Managed configs

Symlinked into `~/.config` from this repo:

`hypr` · `yazi` · `aria2` · `btop` · `helix` · `mpv` · `fastfetch` · `fish` · `gtk-3.0` · `gtk-4.0` · `kitty` · `spicetify` · `yt-dlp` · `zathura` · `zed` · `starship.toml`

See `yazi/README.md` for the full Yazi usage guide.
