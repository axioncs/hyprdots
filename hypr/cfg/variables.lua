local V                   = {}

-- Apps
V.terminal                = "kitty"
V.browser                 = "zen-browser"
V.editor                  = "zeditor"
V.fileManager             = "nautilus"
V.vpn                     = "surfshark"

-- Mod key
V.mod                     = "SUPER"
V.mod2                    = "SUPER + ALT"

-- Layout
V.default_layout          = "scrolling"
V.layout_cycle            = { "scrolling", "dwindle", "monocle", "master" }

-- Gaps
V.gaps_in                 = 5
V.gaps_out                = 10

-- Window styling
V.opacity                 = 0.90
V.rounding                = 20

V.border_size             = 0
V.active_border_color     = "rgba(7fc8ffee)"
V.inactive_border_color   = "rgba(50505088)"

-- Blur
V.blur_enabled            = true
V.blur_size               = 6
V.blur_passes             = 4
V.blur_noise              = 0.02
V.blur_contrast           = 2.0
V.blur_xray               = true

-- Shadow
V.shadow_enabled          = false
V.shadow_range            = 30
V.shadow_power            = 3
V.shadow_offset           = { 0, 10 }
V.shadow_color            = 0x70000000 -- ~"#0007"

-- Cursor
V.cursor_theme            = "Bibata-Modern-Ice"
V.cursor_size             = 20
V.cursor_hide_on_type     = true
V.cursor_inactive_secs    = 1

-- Animations
V.anim_windows_speed      = 3.5
V.anim_workspace_speed    = 3.8
V.anim_layer_speed        = 3.0
V.anim_fade_speed         = 2.5

-- Special workspaces
V.scratchpad_discord_size = { 1600, 900 } -- fixed px (matches your window rule)
V.scratchpad_spotify_size = { "80%", "85%" }

-- Misc
V.volume_step             = 2 -- percent per media key press

return V
