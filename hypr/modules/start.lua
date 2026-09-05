hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("mako")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("$HOME/.config/screen/loop.sh")

    -- open spotify in second workspace
    hl.exec_cmd("[workspace 2 silent] spotify-launcher")
end)
