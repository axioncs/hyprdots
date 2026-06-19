local V = require("cfg/variables")

-- ── Bezier curves ────────────────────────────────────────────────────────────

-- snap: Near-instant initial kick, immediate flatline. Zero trailing float.
hl.curve("snap", { type = "bezier", points = { { 0.1, 1.0 }, { 0.1, 1.0 } } })

-- pop: Modern, high-velocity entry with a crisp, tightly controlled bounce.
hl.curve("pop", { type = "bezier", points = { { 0.15, 1.15 }, { 0.25, 1.0 } } })

-- glide: Extremely fast ease-out. Moves instantly, decelerates smoothly.
hl.curve("glide", { type = "bezier", points = { { 0.15, 1.0 }, { 0.15, 1.0 } } })

-- drift: Fast response that slips into place without a heavy elastic bounce.
hl.curve("drift", { type = "bezier", points = { { 0.2, 1.0 }, { 0.2, 1.0 } } })

-- ── Global switch ────────────────────────────────────────────────────────────
hl.config({ animations = { enabled = true } })

-- ── Windows ──────────────────────────────────────────────────────────────────
-- Open: Explodes out from 88% and snaps into its bounce instantly
hl.animation({
    leaf    = "windowsIn",
    enabled = true,
    speed   = V.anim_windows_speed,
    bezier  = "pop",
    style   = "popin 88%"
})

-- Close: Accelerated exit. Windows should vanish faster than they appear.
hl.animation({
    leaf    = "windowsOut",
    enabled = true,
    speed   = V.anim_windows_speed * 1.25,
    bezier  = "snap",
    style   = "popin 92%"
})

-- Move / resize: Tight tracking that sticks to your cursor/keybinds instantly
hl.animation({
    leaf    = "windows",
    enabled = true,
    speed   = V.anim_windows_speed * 1.1,
    bezier  = "snap"
})

-- ── Workspaces ───────────────────────────────────────────────────────────────
-- Clean, ultra-fast structural slides without any "mushy" deceleration
hl.animation({
    leaf    = "workspaces",
    enabled = true,
    speed   = V.anim_workspace_speed,
    bezier  = "glide",
    style   = "slide"
})

hl.animation({
    leaf    = "workspacesIn",
    enabled = true,
    speed   = V.anim_workspace_speed,
    bezier  = "glide",
    style   = "slide"
})

hl.animation({
    leaf    = "workspacesOut",
    enabled = true,
    speed   = V.anim_workspace_speed * 1.2,
    bezier  = "snap",
    style   = "slide"
})

-- ── Layer-shell (panels, notifications, overlays) ────────────────────────────
hl.animation({
    leaf    = "layersIn",
    enabled = true,
    speed   = V.anim_layer_speed,
    bezier  = "drift",
    style   = "slide"
})

hl.animation({
    leaf    = "layersOut",
    enabled = true,
    speed   = V.anim_layer_speed * 1.3,
    bezier  = "snap",
    style   = "fade"
})

hl.animation({
    leaf    = "fadeLayersIn",
    enabled = true,
    speed   = V.anim_layer_speed,
    bezier  = "glide"
})

hl.animation({
    leaf    = "fadeLayersOut",
    enabled = true,
    speed   = V.anim_layer_speed * 1.3,
    bezier  = "snap"
})

-- ── Fade (focus change, opacity transitions) ─────────────────────────────────
hl.animation({
    leaf    = "fade",
    enabled = true,
    speed   = V.anim_fade_speed,
    bezier  = "glide"
})

hl.animation({
    leaf    = "fadeIn",
    enabled = true,
    speed   = V.anim_fade_speed,
    bezier  = "glide"
})

hl.animation({
    leaf    = "fadeOut",
    enabled = true,
    speed   = V.anim_fade_speed * 1.3,
    bezier  = "snap"
})

-- ── Borders ──────────────────────────────────────────────────────────────────
-- Crisp, structural color shifts when switching active windows
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5.5,
    bezier = "glide"
})
