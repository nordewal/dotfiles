Installation
============
```
bash -c "$(curl -fsSL https://raw.github.com/nordewal/dotfiles/master/bin/dotfiles)" && source ~/.bashrc
```

## Minimal packages
First install yaourt & pacget, then install:

```
arandr bash-completion bind-tools cmake dstat dunst efibootmgr ethtool exfat-utils feh firefox fish-git git gnome-keyring google-chrome gsimplecal gthumb i3-wm i3lock i3status jq keepassxc lshw lsof network-manager-applet networkmanager nfs-utils ngrep ntfs-3g numlockx openssh otf-font-awesome p7zip pavucontrol perf powerline-fonts-git pulseaudio python-neovim rofi rsync scrot speedcrunch strace sublime-text-dev termite termite-terminfo thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman unzip vim wget x86_energy_perf_policy xautolock xorg-server xorg-xev xorg-xinit xorg-xprop
```

## Optional packages:
```
calibre cnijfilter2-mg7500 colorpicker cups darktable-git docker-compose dropbox ghostscript gimp gradle hugin intellij-idea-community-edition jdk8-openjdk jre8-openjdk libreoffice-fresh masterpdfeditor maven mplayer openjdk8-src rawtherapee ristretto s3cmd simple-scan sysstat tcpdump teamviewer unrar vlc wireshark-gtk xcalib
```

## pacman
Remove orphaned duplicates:
```
pacman -Rns $(pacman -Qtdq)
```
List every package you've explicitly installed:
```
pacman -Qei | awk '/^Name/ { name=$3 } /^Groups/ { if ( $3 != "base" && $3 != "base-devel" ) { print name } }'
```

## Open mailto link in GMail
Type in Chrome JS console and click allow:
```
navigator.registerProtocolHandler("mailto", "(1)mail.google.com/mail/?extsrc=mailto&url=%s", "Gmail");
```

## Enable deoplete

1. Install neovim!!
2. open vim
3. run ':UpdateRemotePlugins'
