#!/usr/bin/fish
# Hyprdots installer
# Symlinks managed dotfiles into ~/.config and installs core dependencies via paru.
# Usage:
#   fish install.fish            # install deps + symlink everything (backs up existing)
#   fish install.fish --update   # git pull + re-symlink (no reinstall prompt)
#   fish install.fish -u         # same as --update
#   fish install.fish --help     # show this help

set -l REPO (dirname (realpath (status filename)))
set -l CONFIG "$HOME/.config"
set -l HYPRLAND_DEPS hyprland noctalia-git snappy-switcher kitty zen-browser zed helix fish starship yazi btop fastfetch mpv aria2 yt-dlp spicetify-cli grimblast-git tesseract wireplumber papirus-icon-theme bibata-cursor-theme-bin noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono-nerd
set -l BUILD_DEPS base-devel git

# Items managed by this repo (dir or file, relative to REPO)
set -l ITEMS hypr yazi aria2 btop helix mpv fastfetch fish gtk-3.0 gtk-4.0 kitty spicetify yt-dlp zathura zed starship.toml

function print_help
    echo "Hyprdots installer"
    echo "  fish install.fish            install deps + symlink all configs"
    echo "  fish install.fish --update   git pull + re-symlink (skip dep install)"
    echo "  fish install.fish -u         alias for --update"
    echo "  fish install.fish --help     show this help"
end

# --- parse args ---
set -l UPDATE 0
for arg in $argv
    switch $arg
        case --update -u
            set UPDATE 1
        case --help -h
            print_help
            exit 0
        case '*'
            echo "Unknown argument: $arg"
            print_help
            exit 1
    end
end

function backup_if_exists
    set -l target $argv[1]
    if test -e "$target"; and not test -L "$target"
        set -l bak "$target.bak."(date +%Y%m%d-%H%M%S)
        echo "  backing up $target -> $bak"
        mv "$target" "$bak"
    end
end

function link_item
    set -l name $argv[1]
    set -l src "$REPO/$name"
    set -l dst "$CONFIG/$name"
    if not test -e "$src"
        echo "  SKIP (source missing): $name"
        return
    end
    backup_if_exists "$dst"
    # remove stale symlink if it points nowhere
    if test -L "$dst"; and not test -e "$dst"
        rm "$dst"
    end
    ln -sfn "$src" "$dst"
    if test -e "$dst"
        echo "  OK  $name -> "(readlink -f "$dst")
    else
        echo "  FAIL $name"
    end
end

function notify
    # Send a Noctalia notification if available (best-effort, never fatal)
    if command -v noctalia >/dev/null
        noctalia msg notification-show "Hyprdots -- $argv[1]" 2>/dev/null
    end
    echo "$argv[1]"
end

# --- dependency install (skip on --update) ---
if test $UPDATE -eq 0
    notify "Installing Hyprdots (deps + symlinks)…"
    echo "==> Installing build deps (base-devel, git) if missing"
    sudo pacman -S --needed --noconfirm $BUILD_DEPS

    if not command -v paru >/dev/null
        echo "==> paru not found — bootstrapping from AUR"
        set -l tmp (mktemp -d)
        git clone https://aur.archlinux.org/paru.git "$tmp/paru"
        pushd "$tmp/paru"
        makepkg -si --noconfirm
        popd
        rm -rf "$tmp"
    else
        echo "==> paru already installed"
    end

    echo "==> Installing core dependencies via paru (--needed, skips installed)"
    paru -S --needed --noconfirm $HYPRLAND_DEPS
    notify "Dependencies installed."
else
    notify "Updating Hyprdots…"
    echo "==> Update mode: skipping dependency install"
end

# --- update repo ---
if test $UPDATE -eq 1
    echo "==> git pull in $REPO"
    set -l pull_out (git -C "$REPO" pull --ff-only 2>&1)
    echo $pull_out
    if string match -q '*Already up to date*' $pull_out
        notify "No update available — already up to date."
    end
end

# --- symlink everything ---
echo "==> Linking managed configs into $CONFIG"
for item in $ITEMS
    link_item $item
end

echo
if test $UPDATE -eq 0
    notify "Install complete."
    echo "Done. Log out/in or run 'SUPER + R' to reload Hyprland."
else
    notify "Update complete."
    echo "Update complete. Run 'SUPER + R' to reload Hyprland."
end
