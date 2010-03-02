#
# Completion
#
[ -f /etc/bash_completion ] && source /etc/bash_completion

#
# Environment
#
export EDITOR='vim'

#
# Grep 
#
export GREP_OPTIONS='--color=auto'

#
# History
#
shopt -s histappend                         # Append each(!) history entry from all terminals realtime(not after sesion ending)
shopt -s cmdhist                            # store multiline commands as 1 line
shopt -s cdspell                            # spelling error correction 
shopt -s checkwinsize                       # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
export HISTCONTROL="ignoredups"             # ignore duplicates(store command once)
export HISTCONTROL="ignoreboth"
export HISTIGNORE="&:ls:[bf]g:exit:%[0-9]"  # ignore simple commands
export HISTFILESIZE=5000                    # history file size

#
# Prompt command
#
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
export PROMPT_COMMAND="$PROMPT_COMMAND;history -a" #evaluated each time command line-prompt is printed so we hook up history appending there

#
# Prompt string
#
PS1='\[\033[1;3;12;43m\]\D{%H:%M}\[\033[0;20m\]\[\033[0;35m\] $(__git_ps1 "%s\\\" )\[\033[00m\]\[\033[01;34m\]\W\[\033[00m\]\$ '
