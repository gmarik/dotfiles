#!/bin/bash

for f in *.mp3; do 
  echo "$f"
  mkdir -p out/
  ffmpeg -i ./"$f" -acodec mp2 -ab 128k  ./out/"$f"
done
