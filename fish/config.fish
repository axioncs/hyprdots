source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
if status is-interactive
    # Starship custom prompt
    starship init fish | source

    # Direnv + Zoxide
    command -v direnv &>/dev/null && direnv hook fish | source
    command -v zoxide &>/dev/null && zoxide init fish --cmd cd | source
    zoxide init fish | source

    # Aliases
    alias aria='hermes'
    alias bat="bat --style=plain"

    # Abbrs
    abbr lg lazygit
    abbr gd 'git diff'
    abbr ga 'git add .'
    abbr gc 'git commit -am'
    abbr gl 'git log'
    abbr gs 'git status'
    abbr gst 'git stash'
    abbr gsp 'git stash pop'
    abbr gp 'git push'
    abbr gpl 'git pull'
    abbr gsw 'git switch'
    abbr gsm 'git switch main'
    abbr gb 'git branch'
    abbr gbd 'git branch -d'
    abbr gco 'git checkout'
    abbr gsh 'git show'

    abbr l ls
    abbr ll 'ls -l'
    abbr la 'ls -a'
    abbr lla 'ls -la'

    abbr pi 'paru -S'
    abbr u 'paru -Syu'
    abbr c 'paru -Scc'
    abbr i 'sudo pacman -S'
    abbr pu 'sudo pacman -Syu'
    abbr pc 'sudo pacman -Scc'
    abbr au 'aria update'
    abbr r reboot
    abbr sn 'sudo nano'
    abbr s sudo
    abbr k pkill
end

fish_add_path /home/axioncs/.spicetify
fish_add_path ~/.local/bin
set -x R_LIBS_USER ~/.local/lib/R/library
