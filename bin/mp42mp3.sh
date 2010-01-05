!#/bin/sh

faad $1 -o -|lame -b 192 -h - "$1".mp3
