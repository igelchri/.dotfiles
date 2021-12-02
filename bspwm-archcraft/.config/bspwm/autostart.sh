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
killall -9 dunst xsettingsd sxhkd polybar ksuperkey xfce4-power-manager

# Lauch notification daemon
dunst \
-geom "280x50-10+42" -frame_width "1" -font "Iosevka Custom 9" \
-lb "$BACKGROUND" -lf "$FOREGROUND" -lfr "$BLUE" \
-nb "$BACKGROUND" -nf "$FOREGROUND" -nfr "$BLUE" \
-cb "$BACKGROUND" -cf "$RED" -cfr "$RED" &

# Lauch xsettingsd daemon
xsettingsd &

#+++ Keybindings
sxhkd &
#run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

#+++ Polybar
#$HOME/.config/bspwm/polybar/launch.sh &
bspbar

#+++ Wallpaper
#feh --bg-scale ~/.config/bspwm/wall.png &
bash $HOME/.fehbg

#+++ conky
#conky -c $HOME/.config/bspwm/system-overview &

#+++ Programme starten
# Fix cursor
xsetroot -cursor_name left_ptr &
# Enable power management
xfce4-power-manager &
numlockx on &
#picom --config $HOME/.config/bspwm/picom.conf &
bspcomp

#run nm-applet &
#run pamac-tray &
#blueberry-tray &

# polkit agent
if [[ ! `pidof xfce-polkit` ]]; then
	/usr/lib/xfce-polkit/xfce-polkit &
fi

#/usr/lib/xfce4/notifyd/xfce4-notifyd &
#run volumeicon &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# Start mpd
exec mpd &


# Start bspwm scripts
bspcolors
#bspfloat &


