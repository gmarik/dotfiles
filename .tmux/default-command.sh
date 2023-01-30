#!/bin/bash

user_shell="$SHELL"

command_exists () {
  type "$1" &> /dev/null ;
}


platform="`uname -s|tr '[A-Z]' '[a-z]'`"

case "${platform}" in
  darwin) 
    if command_exists reattach-to-user-namespace; then
      # reattach-to-user-namespace -l sh ~/dotfiles/tmux/clipboard.sh &
      reattach-to-user-namespace -l "$user_shell"
    else
      echo "reattach-to-user-namespace not found \
        $platform clipboard will not work \
        you can: brew install reattach-to-user-namespace"

      exec $user_shell
    fi
    ;;
  linux)
    exec $user_shell;;
  *)
    exec $user_shell;;
esac
