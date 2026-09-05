hl.monitor({
    output = "DP-1",
    mode = "2560x1440@59.95Hz",
    position = "0x0",
    scale = "1",
})
hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        background_color = "rgb(ffffff)",
    }
})

hl.config({
    input = {
        kb_layout     = "no",
        kb_variant    = "winkeys",
        kb_model      = "logitech",
        kb_options    = "caps:super",

        follow_mouse  = 1,
        sensitivity   = 0,
        accel_profile = "flat",
        touchpad      = {
            natural_scroll = false,
        },
    }
})
