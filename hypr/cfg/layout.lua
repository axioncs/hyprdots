local V = require("cfg/variables")

hl.config({
    general = {
        layout           = V.default_layout,
        allow_tearing    = false,
        gaps_in          = V.gaps_in,
        gaps_out         = V.gaps_out,
        border_size      = V.border_size,
        resize_on_border = true,
        col              = {
            active_border   = V.active_border_color,
            inactive_border = V.inactive_border_color,
        },
    },

    decoration = {
        rounding = V.rounding,
        rounding_power = 2,
        shadow = {
            enabled      = V.shadow_enabled,
            range        = V.shadow_range,
            render_power = V.shadow_power,
            offset       = V.shadow_offset,
            color        = V.shadow_color,
        },
    },

    dwindle = {
        preserve_split = true,
        smart_split    = false,
        smart_resizing = true,
    },

    master = {
        new_status  = "master",
        mfact       = 0.55,
        orientation = "left",
    },

    scrolling = {
        column_width             = 0.5,
        fullscreen_on_one_column = true,
        follow_focus             = true,
        focus_fit_method         = 1,
        follow_min_visible       = 0.0,
    },
})
