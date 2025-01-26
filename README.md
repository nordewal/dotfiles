Installation
============
```
bash -c "$(curl -fsSL https://raw.github.com/nordewal/dotfiles/master/bin/dotfiles)"
```

## Install the following packages
```
code fish gnome-keyring grim groff keepassxc alacritty mako neovim networkmanager pavucontrol playerctl pipewire pipewire-pulse slurp swappy sway swayidle waybar swaylock wlrctl ttf-fira-code ttf-font-awesome wl-clipboard wofi safeeyes xdg-desktop-portal-wlr grim networkmanager-dmenu
```

## Run sway
.config/fish/config_local.fish
```
# Start sway at login
if status --is-interactive
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    set -Ux SDL_VIDEODRIVER wayland
    set -Ux _JAVA_AWT_WM_NONREPARENTING 1
    set -Ux QT_QPA_PLATFORM wayland
    set -Ux XDG_CURRENT_DESKTOP sway
    set -Ux XDG_SESSION_DESKTOP sway
    exec sway
  end
end
```

## Enable deoplete

1. Install neovim!!
2. open vim
3. run ':UpdateRemotePlugins'
