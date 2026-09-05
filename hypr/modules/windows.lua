hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 8,
        border_size = 2,

        col = {
            active_border = "rgb(088199)",
            inactive_border = "rgb(088199)",
        },

        resize_on_border = true,
        allow_tearing = false,
    },

    decoration = {
        rounding = 2,
        rounding_power = 2.0,

        active_opacity = 0.9,
        inactive_opacity = 0.4,

        shadow = {
            enabled = false,
        },

        blur = {
            enabled = true,

            brightness = 1,
            contrast = 1,
            passes = 1,
            noise = 0,
            size = 4,
            xray = false,

            -- TODO: Test variants when released.
        },
    },
})

hl.window_rule({
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

hl.window_rule({
    match = {
        class = "^$",
        title = "^$",
        xwayland = 1,
        float = 1,
        fullscreen = 0,
        pin = 0,
    },
    no_focus = true,
})

hl.window_rule({
    match = {
        class = "kitty",
    },
    no_blur = false,
})

hl.layer_rule({
    match = { namespace = "waybar" },
    blur = true,
    blur_popups = true,
    ignore_alpha = 0.1,
})

hl.layer_rule({
    match = { namespace = "notifications" },
    blur = true,
    ignore_alpha = 0.01,
})

hl.layer_rule({
    match = { namespace = "selection" },
    blur = false,
})
