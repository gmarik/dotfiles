#!/bin/bash
download_pattern='<a href="/downloads/b4winckler/macvim/MacVim-snapshot-.*">'
download_path=$(curl https://github.com/b4winckler/macvim/downloads| grep "${download_pattern}"|cut -f2 -d\"|head -1)
dirname=$(basename -s tgz ${download_path})
curl --location https://github.com${download_path} | tar -x -z -C ~/Downloads/ && open ~/Downloads/${dirname}
