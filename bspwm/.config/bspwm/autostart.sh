#!/bin/bash
###--------  Meine BSPWMRC - Autostart  ----------
###--------  Stand: 30.11.21 ---------
#pgrep -x sxhkd > /dev/null || sxhkd &

# fix pointer
xsetroot -cursor_name left_ptr

# Kill if already running
killall -9 picom sxhkd dunst xfce4-power-manager ksuperkey eww

# Restore wallpaper
bash $HOME/.config/bspwm/.fehbg

#+++ Polybar
$HOME/.config/bspwm/polybar/launch.sh

# Launch Conkeww
sed -i "s/colors\/color-.*/colors\/color-tokyo.yuck\")/g" $HOME/.config/conkeww/eww.yuck
eww --config $HOME/.config/conkeww/ open conkeww-main

# Launch notification daemon
dunst -config $HOME/.config/bspwm/dunstrc &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# polkit agent
if [[ ! `pidof xfce-polkit` ]]; then
    /usr/lib/xfce-polkit/xfce-polkit &
fi

# Lauch keybindings daemon
#sxhkd &
sxhkd -c $HOME/.config/bspwm/sxhkd/sxhkdrc &

# Enable power management
xfce4-power-manager &

# Start udiskie
udiskie &

# start compositor
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config $HOME/.config/bspwm/picom.conf &

# replace neovim colorscheme
sed -i "s/theme =.*$/theme = \"tokyonight\",/g" $HOME/.config/nvim/lua/chadrc.lua

# change xfce4-terminal colorscheme
XFCE_TERM_PATH="$HOME/.config/xfce4/terminal"
cp "$XFCE_TERM_PATH"/colorschemes/tokyo-night "$XFCE_TERM_PATH"/terminalrc

# Start mpd
exec mpd &

