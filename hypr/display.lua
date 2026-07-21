-- --- https://wiki.hypr.land/Configuring/Monitors/ ---

hl.monitor({
    output = "DP-1",
    mode = "2560x1440@59.95Hz",
    position = "0x0",
    scale = "1",
})

-- --- https://wiki.hypr.land/Configuring/Environment-variables/ ---

hl.env("GDK_SCALE", "1")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- nvidia
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("__GL_GSYNC_ALLOWED", "1")
hl.env("__GL_VRR_ALLOWED", "0")
hl.env("WLR_NO_HARDWARE_CURSORS", "0")

-- --- https://wiki.hypr.land/Configuring/Variables/ ---

-- https://wiki.hypr.land/Configuring/Variables/#input

hl.animation({
    leaf = "global",
    enabled = true,
    speed = 4,
    bezier = "default",
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
    match = { class = "notifications" },
    blur = true,
    ignore_alpha = 0.01,
})

hl.config({
    input = {
        kb_layout = "no",
        kb_variant = "winkeys",
        kb_model = "logitech",
        kb_options = "caps:super",
        follow_mouse = 1,
        sensitivity = 0,
        accel_profile = "flat",
        touchpad = {
            natural_scroll = false,
        },
    },
    -- https://wiki.hypr.land/Configuring/Variables/#general
    general = {
        gaps_in = 4,
        gaps_out = 8,
        border_size = 2,
        col = {
            active_border = "rgb(088199)",
            inactive_border = "rgba(08819980)",
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
    -- https://wiki.hypr.land/Configuring/Variables/#decoration
    decoration = {
        rounding = 4,
        rounding_power = 2.0,
        active_opacity = 0.9,
        inactive_opacity = 0.4,
        -- https://wiki.hypr.land/Configuring/Variables/#shadow
        shadow = {
            enabled = false,
        },
        -- https://wiki.hypr.land/Configuring/Variables/#blur
        blur = {
            enabled = true,
            size = 4,
            passes = 1,
            new_optimizations = true,
        },
    },
    -- https://wiki.hypr.land/Configuring/Animations/
    animations = {
        enabled = true,
    },
    -- https://wiki.hypr.land/Configuring/Variables/#misc
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
    -- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
    dwindle = {
        preserve_split = true,
    },
    -- https://wiki.hypr.land/Configuring/Master-Layout/
    master = {
        new_status = "master",
    },
    -- --- https://wiki.hypr.land/Configuring/Window-Rules/ --- https://wiki.hypr.land/Configuring/Workspace-Rules/ ---
})
