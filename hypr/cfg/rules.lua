local V = require("cfg/variables")

hl.workspace_rule({ workspace = "1", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1", persistent = true })

hl.layer_rule({
    name = "noctalia",

    match = {
        namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
    },
    ignore_alpha = 0.5,
    blur = true,
    blur_popups = true,
})

hl.workspace_rule({
    workspace        = "special:discord",
    on_created_empty = "discord",
})

hl.workspace_rule({
    workspace = "special:aria",
})

hl.window_rule({
    match    = { class = ".*" },
    rounding = V.rounding,
    opacity  = string.format("%.2f override %.2f override", V.opacity_focused, V.opacity_unfocused),
})

-- ── Special workspace window rules ───────────────────────────────────────────

-- Discord / Equibop → special:discord scratchpad
hl.window_rule({
    match     = { class = "^(equibop|discord)$" },
    workspace = "special:discord",
    float     = true,
    size      = V.scratchpad_discord_size,
})

-- Aria Chat → special:aria scratchpad
hl.window_rule({
    match     = { class = "^aria-chat$" },
    workspace = "special:aria",
    float     = true,
    size      = V.scratchpad_aria_size,
})

-- Spotify → special:spotify scratchpad
hl.window_rule({
    match     = { class = "^(Spotify|spotify)$" },
    workspace = "special:spotify",
    float     = true,
    size      = V.scratchpad_spotify_size,
})

-- ── Application-specific rules ───────────────────────────────────────────────

-- File pickers (Nautilus/GTK) -> float, center, no decoration
hl.window_rule({
    match    = { title = "^(Open File|Open Folder|Open|Save|Save As|Export|Import|Choose File|Rename)$" },
    float    = true,
    center   = true,
    decorate = false,
    opacity  = 1.0,
})


-- Apps that should always tile (never accidentally float)

-- hl.window_rule({
--     match = { class = "^(helium|twintaillauncher|dev\\.zed\\.Zed|hayase)$" },
--     float = false,
-- })

-- Steam: float most windows, but keep the main client tiled
hl.window_rule({
    match = { class = "steam" },
    float = true,
})
hl.window_rule({
    match = { class = "steam", title = "^[Ss]team$" },
    float = false,
})

-- Steam notification toasts: bottom-right corner, unfocused
hl.window_rule({
    match    = { class = "steam", title = "^notificationtoasts_\\d+_desktop$" },
    float    = true,
    no_focus = true,
    move     = { "monitor_w - window_w - 10", "monitor_h - window_h - 10" },
})

-- Aria Voice Overlay: bottom-right corner, unfocused
hl.window_rule({
    match    = { title = "^Aria Voice$" },
    float    = true,
    no_focus = true,
    move     = { "monitor_w - window_w - " .. V.aria_voice_margin, "monitor_h - window_h - " .. V.aria_voice_margin },
})

-- imv: floating image viewer
hl.window_rule({
    match = { class = "imv" },
    float = true,
})
