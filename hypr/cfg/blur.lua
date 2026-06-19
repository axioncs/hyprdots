local V = require("cfg/variables")

hl.config({
    decoration = {
        blur = {
            enabled  = V.blur_enabled,
            size     = V.blur_size,
            passes   = V.blur_passes,
            noise    = V.blur_noise,
            contrast = V.blur_contrast,
            xray     = V.blur_xray,
        },
    },
})
