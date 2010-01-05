#!/bin/sh

mplayer -fs $(echo "http://youtube.com/get_video.php?$(curl -s $1 | sed -n "/watch_fullscreen/s;.*\(video_id.\+\)&title.*;\1;p")")
