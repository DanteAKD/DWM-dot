#!/bin/sh 
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


feh --bg-scale /home/irisu/Pictures/Colourful/cloud &
slstatus &
clipmenud &
easyeffects &
fcitx5 &
picom --animations -b &
dunst &
xset -dpms &
set xset off &
xrandr --output DP-2 --mode 1920x1080 --rate 144 &
xrandr --dpi 100
exec dwm
