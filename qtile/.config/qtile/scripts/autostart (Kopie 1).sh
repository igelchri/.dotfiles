#!/usr/bin/env bash 
#
# meine Autostart Datei für QTile
#
# Stand: 24-06-23

# Colorscheme auswählen (geht noch nicht)
COLORSCHEME=DoomOne

### AUTOSTART PROGRAMS ###
# extra from ArcoLinux
function run {
  if ! pgrep -x $(basename $1 | head -c 15) 1>/dev/null;
  then
    $@&
  fi
}

# Bildschirm einstellen
autorandr --change

# Desktop Wallpaper
feh --bg-fill /home/chris/.config/qtile/wall.jpg &
feh --bg-fill /home/chris/.config/qtile/wall.jpg &

#start sxhkd to replace Qtile native key-bindings
run sxhkd -c ~/.config/qtile/sxhkd/sxhkdrc &

# Picom 
picom --daemon &
# picom --config $HOME/.config/qtile/scripts/picom.conf &

# Emacs Daemon starten
/usr/bin/emacs --daemon &


#starting utility applications at boot time
#run variety &
run nm-applet &
#run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

#starting user applications at boot time
#run volumeicon &

## conky 

conky -c "$HOME"/.config/qtile/scripts/conky.conf || echo "Couldn't start conky."
