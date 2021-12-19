#!/bin/bash
###--------  Meine BSPWMRC - Autostart  ----------
###--------  Stand: 30.11.21 ---------

#function run {
#  if ! pgrep $1 ;
#  then
#    $@&
#  fi
#}

# Kill if already running
killall -9 xsettingsd sxhkd dunst ksuperkey xfce4-power-manager

# Lauch notification daemon
dunst \
-geom "280x50-10+42" -frame_width "1" -font "Iosevka Custom 9" \
-lb "$BACKGROUND" -lf "$FOREGROUND" -lfr "$BLUE" \
-nb "$BACKGROUND" -nf "$FOREGROUND" -nfr "$BLUE" \
-cb "$BACKGROUND" -cf "$RED" -cfr "$RED" &

# Lauch xsettingsd daemon
xsettingsd &

# Lauch keybindings daemon
#sxhkd &
sxhkd -c $HOME/.config/bspwm/sxhkd/sxhkdrc &

#+++ Polybar
#$HOME/.config/bspwm/polybar/launch.sh &
bspbar

#+++ Wallpaper
feh --bg-scale ~/.config/bspwm/wall.png &
#bash $HOME/.fehbg

#+++ conky
#conky -c $HOME/.config/bspwm/system-overview &

#+++ Programme starten
# Fix cursor
xsetroot -cursor_name left_ptr &
# Enable power management
xfce4-power-manager &
numlockx on &

#-- Transparenz
#picom --config $HOME/.config/bspwm/picom.conf &
bspcomp

#run nm-applet &
#run pamac-tray &
#blueberry-tray &
#run volumeicon &
#/usr/lib/xfce4/notifyd/xfce4-notifyd &

# polkit agent
if [[ ! `pidof xfce-polkit` ]]; then
	/usr/lib/xfce-polkit/xfce-polkit &
fi



# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# Start mpd
exec mpd &


# Start bspwm scripts
bspcolors
bspfloat &


