#!/bin/bash
###--------  Meine BSPWMRC - Autostart  ----------
###--------  Stand: 220713 ---------

## Autostart -------------------------------------------------#

# Kill if already running
killall -9 xsettingsd sxhkd dunst ksuperkey xfce4-power-manager

# Lauch xsettingsd daemon
xsettingsd &

# polkit agent
if [[ ! `pidof xfce-polkit` ]]; then
	/usr/lib/xfce-polkit/xfce-polkit &
fi

# Lauch keybindings daemon
#sxhkd &
sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# Enable power management
xfce4-power-manager &

# Fix cursor
xsetroot -cursor_name left_ptr

# Restore wallpaper
bash $HOME/.fehbg
#bash $HOME/.config/bspwm/.fehbg

# Start mpd
exec mpd &

#start emacs-daemon
exec /usr/bin/emacs --daemon &

# Start bspwm scripts
bspcolors
bspbar
bspcomp
bspdunst
bspfloat &

