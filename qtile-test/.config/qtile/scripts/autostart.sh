#!/usr/bin/env bash 

COLORSCHEME=DoomOne

### AUTOSTART PROGRAMS ###
picom --daemon &
#picom --config $HOME/.config/picom.conf &
/usr/bin/emacs --daemon &
nm-applet &
"$HOME"/.screenlayout/home.sh &
#sleep 1
conky -c "$HOME"/.config/qtile/scripts/conky.conf || echo "Couldn't start conky."

function run {
  if ! pgrep -x $(basename $1 | head -c 15) 1>/dev/null;
  then
    $@&
  fi
}

#autostart ArcoLinux Welcome App
#run dex $HOME/.config/autostart/arcolinux-welcome-app.desktop &

# Desktop Wallpaper
feh --bg-fill /home/chris/.config/qtile/wall.jpg &
feh --bg-fill /home/chris/.config/qtile/wall.jpg &

#start sxhkd to replace Qtile native key-bindings
run sxhkd -c ~/.config/qtile/sxhkd/sxhkdrc &

#starting utility applications at boot time
#run variety &
#run nm-applet &
#run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &

#starting user applications at boot time
run volumeicon &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &
