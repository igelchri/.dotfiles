																				4#!/bin/bash
###--------  Meine BSPWMRC - Autostart  ----------
###--------  Stand: 220220 ---------

# fix pointer
xsetroot -cursor_name left_ptr

# Restore wallpaper
bash $HOME/.config/bspwm/.fehbg

# Polybar
$HOME/.config/bspwm/polybar/launch.sh

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# Lauch keybindings daemon
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

# Start Clipboard
run clipit &

# Volume tray
#run volumeicon &

# network manager tray
run nm-applet &

# pacman tray
run pamac-tray &

# power management
run xfce4-power-manager &

# numlockx
numlockx on &

# bluetotth
blueberry-tray &

# start compositor
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config $HOME/.config/bspwm/picom.conf &

# polkit agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Launch notification daemon
/usr/lib/xfce4/notifyd/xfce4-notifyd &

# Start mpd
exec mpd &

# conky
#conky -c $HOME/.config/bspwm/system-overview &
