#
# Prompt command
#
bak_prompt () { 
  PS1L=$(printf '%s' `basename $PWD`)
  PS1R=$(printf '%s' `dirname $PWD`)
  printf "%s>%$(( ${COLUMNS}-${#PS1L}-1 ))s" $PS1L $PS1R
}

ssh_prompt() {
  local ssh_host=''
  if [ "$SSH_CONNECTION" ]; then 
    ssh_host="@$(hostname):"
  fi

  echo "$ssh_host"
}


# PS1='$(_prompt) [1A [7C'
# PS1='$(_prompt) '


#
# Prompt string
#

# https://wiki.archlinux.org/index.php/Bash/Prompt_customization
# Note: Wrapping the output in \[ \] is recommended by the Bash man page. 
# This helps Bash ignore non-printable characters so that it correctly calculates the size of the prompt.
# https://wiki.archlinux.org/index.php/Bash/Prompt_customization#Embedding_commands
# https://unix.stackexchange.com/questions/105958/terminal-prompt-not-wrapping-correctly
# ps1='\[${rst}${bwht}${bgblk}\]\D{%H:%M}'
# ps1+='\[${rst}${bpur}\]$( __git_ps1 "%s" )'
# ps1+='\[${rst}${tgrn}\]$( _git_status_stats "[%s]" )'
# ps1+='\[${rst}${tylw}\]$( ssh_prompt)'
# ps1+='\[${rst}${tred}\]$( V=$PIPESTATUS; if [[ $V -gt 0 ]]; then printf "%d" $V ; fi )'
# ps1+='\n'
# ps1+='\[${rst}${tylw}\]\W'
# ps1+='\[${tgrn}\]\$'
# ps1+='\[${rst}\] '
# 
# PS1="$ps1"

# export PROMPT_COMMAND="_prompt;history -a" #evaluated each time command line-prompt is printed so we hook up history appending there

# https://wiki.archlinux.org/index.php/Bash/Prompt_customization
# Note: Wrapping the output in \[ \] is recommended by the Bash man page. 
# This helps Bash ignore non-printable characters so that it correctly calculates the size of the prompt.
# https://wiki.archlinux.org/index.php/Bash/Prompt_customization#Embedding_commands
# https://unix.stackexchange.com/questions/105958/terminal-prompt-not-wrapping-correctly
ps1='\[${rst}${bwht}${bgblk}\]\D{%H:%M}'
ps1+='\[${rst}${bpur}\]$( __git_ps1 "%s" )'
ps1+='\[${rst}${tgrn}\]$( _git_status_stats "[%s]" )'
ps1+='\[${rst}${tylw}\]$( ssh_prompt)'
ps1+='\[${rst}${tred}\]$( V=$PIPESTATUS; if [[ $V -gt 0 ]]; then printf "%d" $V ; fi )'
# https://apple.stackexchange.com/questions/139807/what-does-update-terminal-cwd-do-in-the-terminal-of-os-x/139808#139808
ps1+='\[${rst}\]$(update_terminal_cwd)'
ps1+='\[${rst}\]\n'
ps1+='\[${rst}${tylw}\]\W'
ps1+='\[${tgrn}\]\$'
ps1+='\[${rst}\] '

PS1="$ps1"

export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$"\n"}history -a"
