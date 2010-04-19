#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#exec gnome-session
/etc/X11/xinit/xinitrc.d/98vboxadd-xclient.sh && exec wmii
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
