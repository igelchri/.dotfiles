#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

desktop=$(echo $DESKTOP_SESSION)
count=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)


case $desktop in

    bspwm|/usr/share/xsessions/bspwm)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-bspwm -c ~/.config/bspwm/polybar/config &
      done
    else
    polybar --reload mainbar-bspwm -c ~/.config/bspwm/polybar/config &
    fi
    # second polybar at bottom
    # if type "xrandr" > /dev/null; then
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload mainbar-bspwm-extra -c ~/.config/bspwm/polybar/config &
    #   done
    # else
    # polybar --reload mainbar-bspwm-extra -c ~/.config/bspwm/polybar/config &
    # fi
    ;;

    leftwm|/usr/share/xsessions/leftwm)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-leftwm -c ~/.config/leftwm/polybar/config &
      done
    else
    polybar --reload mainbar-leftwm -c ~/.config/leftwm/polybar/config &
    fi
    # second polybar at bottom
    # if type "xrandr" > /dev/null; then
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload mainbar-leftwm-extra -c ~/.config/leftwm/polybar/config &
    #   done
    # else
    # polybar --reload mainbar-leftwm-extra -c ~/.config/leftwm/polybar/config &
    # fi
    ;;

esac
