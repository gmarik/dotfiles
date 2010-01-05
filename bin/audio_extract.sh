#!/bin/bash

ffmpeg -i $1 -vn -acodec copy $1.mp3
