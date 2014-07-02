#!/bin/sh

user_shell=$SHELL

command_exists () {
  type "$1" &> /dev/null ;
}

system_name="`uname -s`"
if [ "$system_name" == "Darwin" ]; then
  if command_exists reattach-to-user-namespace; then
    # reattach-to-user-namespace -l sh ~/dotfiles/tmux/clipboard.sh &
    reattach-to-user-namespace -l "$user_shell"
  else
    echo "reattach-to-user-namespace not found \
      $system_name clipboard will not work \
      you can: brew install reattach-to-user-namespace"
    $user_shell
  fi
else
  $user_shell
fi
