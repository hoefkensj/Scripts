#/usr/bin/env bash
OUTPUT="DP-0"

MODENAME=1920x1080
MODESTR='"1920x1000" 173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync'

xrandr --newmode "1920x1000" 173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode DP-0 1920x1080
xrandr --output DP-0 --mode 1920x1080



#xrandr --output VGA1 --mode 1280x1024_60.00 && sleep 5 && xrandr --newmode "1024x768-safe" 65.00 1024 1048 1184 1344 768 771 777 806 -HSync -VSync && xrandr --addmode VGA1 1024x768-safe && xrandr --output VGA1 --mode 1024x768-safe
