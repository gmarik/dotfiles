#
# Prompt command
#
bak_prompt () { 
  PS1L=$(printf '%s' `basename $PWD`)
  PS1R=$(printf '%s' `dirname $PWD`)
  printf "%s>%$(( ${COLUMNS}-${#PS1L}-1 ))s" $PS1L $PS1R
}

# PS1='$(_prompt) [1A [7C'
# PS1='$(_prompt) '


#
# Prompt string
#

_prompt() {
  # $? is preserved after last command exit until next command run
  # but let's just print it once
  __curr_exit=$PIPESTATUS
  if [[ "$__last_exit" != "$__curr_exit" ]]; then
    __last_exit=$__curr_exit
    __last_exit_once=$(printf "${tred}%s" "${__last_exit}")
  else
    __last_exit_once=""
  fi
  ps1='${rst}${bwht}${bgblk}\D{%H:%M}'
  ps1+='${rst}$( __git_ps1 "${bpur}%s" )'
  ps1+='${rst}$( _git_status_stats "${tgrn}[%s]" )'
  ps1+='\n'
  ps1+='${rst}${tylw}$( ssh_prompt)'
  ps1+='${rst}${tylw}\W'
  ps1+='${rst}${__last_exit_once}'
  ps1+='${rst}${tgrn}\$'
  ps1+='${rst} '

  PS1="$ps1"
}

export PROMPT_COMMAND="_prompt;history -a" #evaluated each time command line-prompt is printed so we hook up history appending there

