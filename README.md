# :--)

<details>
    <summary>Dependencies</summary>

## Bare minimum

System dependencies and base hyprland.

### System

Assumes AMD CPU, Nvidia GPU (actively supported; not older ones!) and an btrfs filesystem.

```
amd-ucode
base
btrfs-progs
linux
linux-firmware
linux-headers
networkmanager
nvidia-open-dkms
nvidia-settings
nvidia-utils
pipewire
sudo
vim
wireplumber
```

### Hyprland

```
hypridle
hyprland
hyprlock
libnotify
mako
noto-fonts-emoji
playerctl
swaybg
swayidle
ttf-jetbrains-mono-nerd
waybar
wl-clipboard
wofi
```

## For the dots

```
dolphin
firefox
fish
kitty
spotify-launcher
torbrowser-launcher
```

### Additions for developing

```
bind
less
openssh

git
github-cli

zed
gnome-keyring # to persist zed logins
seahorse      # gui for changing keys

blender
tree
rust
nmap
rsync
which
```

## For the scripts for the dots

Packages pulled in only because a script under `~/.config/` needs it or one of it's binaries at runtime.

### waybar

```
hyprpicker
slurp
grim

# ~/.config/waybar/gpu.sh
nvidia-utils # uses `nvidia-smi` from it

# ~/.config/waybar/record.sh
wf-recorder
wl-clipboard # uses `wl-copy` from it

# ~/.config/waybar/transparency.sh
bc
jq
```

### screen

```
wireplumber # uses `wpctl` to find active streams
swaybg
```

</details>
