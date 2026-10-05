-- Look and feel configuration

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 8,
        border_size = 2,
        extend_border_grab_area = 10,
        resize_on_border = true,
        col = {
            active_border = {
                colors = { CACHYLGREEN, CACHYDGREEN },
                angle = 45,
            },
            inactive_border = CACHYGRAY,
        },
    },
    group = {
        col = {
            border_active = CACHYLBLUE,
            border_inactive = CACHYGRAY,
            border_locked_active = CACHYDBLUE,
            border_locked_inactive = CACHYGRAY,
        },
        groupbar = {
            col = {
                active = CACHYLGREEN,
                inactive = CACHYGRAY,
                locked_active = CACHYDBLUE,
                locked_inactive = CACHYGRAY,
            },
        },
    },
    decoration = {
        dim_special = 0.3,
        rounding = 16,
        active_opacity = 0.95,
        inactive_opacity = 0.85,
        fullscreen_opacity = 1,

        shadow = {
            enabled      = true,
            range        = 20,
            offset       = {0, 2},
            render_power = 10,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled = true,
            xray = true,
            special = false,
            new_optimizations = true,
            size = 9,
            passes = 2,
            brightness = 1,
            noise = 0.08,
            contrast = 0.89,
            vibrancy = 0.5,
            vibrancy_darkness = 0.5,
            popups = true,
            popups_ignorealpha = 0.6,
            input_methods = false,
            input_methods_ignorealpha = 0.8
        },
    },
})
