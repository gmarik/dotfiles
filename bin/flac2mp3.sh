#!/bin/bash
for d in *; do
  pushd "$d"
  for file in *.flac; do $(flac -cd "$file" | lame -h -b 192 - "${file%.flac}.mp3"); done
  popd
done
