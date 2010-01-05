# Use bash-completion, if available
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

export EDITOR='vim'

## Coloring grep
#use color and line number
export GREP_OPTIONS='--color=auto'
#export GREP_COLOR='0;33;47'

# History
## Append each(!) history entry from all terminals realtime(not after sesion ending)
shopt -s histappend
##evaluated each time command line-prompt is printed so we hook up history appending there
##if predefined PROMPT_COMMAND
export PROMPT_COMMAND="$PROMPT_COMMAND;history -a"
##otherwise
#export PROMPT_COMMAND="history -a"
## store multiline commands as 1 line
shopt -s cmdhist
## spelling error correction 
shopt -s cdspell
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
## ignore duplicates(store command once)
export HISTCONTROL="ignoredups"
export HISTCONTROL="ignoreboth"
## ignore simple commands
#export HISTIGNORE="&:ls:[bf]g:exit:%[0-9]"
## history file size
export HISTFILESIZE=5000

##Prompt string
#PS1='\[\033[1;3;12;43m\]\D{%H:%M}\[\033[0;20m\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[0;35m\]$(__git_ps1 "%s\\\" )\[\033[00m\]\[\033[01;34m\]\W\[\033[00m\]\$ '
PS1='\[\033[1;3;12;43m\]\D{%H:%M}\[\033[0;20m\]\[\033[0;35m\] $(__git_ps1 "%s\\\" )\[\033[00m\]\[\033[01;34m\]\W\[\033[00m\]\$ '
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
