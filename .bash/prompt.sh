#
# Prompt command
#
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
export PROMPT_COMMAND="$PROMPT_COMMAND;history -a" #evaluated each time command line-prompt is printed so we hook up history appending there

_prompt () { 
  PS1L=$(printf '%s' `basename $PWD`)
  PS1R=$(printf '%s' `dirname $PWD`)
  printf "%s>%$(( ${COLUMNS}-${#PS1L}-1 ))s" $PS1L $PS1R
}

# PS1='$(_prompt) [1A [7C'
# PS1='$(_prompt) '

#
# Prompt string
#
ps1='\[$rst\]\[$bwht\]\[$bgblk\]\D{%H:%M}'
ps1+='\[$rst\]$( __git_ps1 "\[$bpur\]%s" )'
ps1+='\[$rst\]$( _git_status_stats "\[$tgrn\][%s]" )'
ps1+='\n'
ps1+='\[$rst\]\[$tylw\]$( ssh_prompt)'
ps1+='\[$rst\]\[$tylw\]\W'
ps1+='\[$rst\]\[$tgrn\]\$\[$rst\] '

PS1="$ps1"
