# vim: set ft=sh ts=2 sw=2 et:

alias ..='cd ..'
alias ...='cd ../..'

alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

alias mdcd='f () { mkdir -p $1 && cd $1; }; f '
alias mkdir='mkdir -p'
alias md='mkdir'

alias ls='ls -h --color=auto'
alias l1='ls -1'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -l'

alias du='du -sh'
alias dua='\du -ah'

alias tf='tail -f '
alias less='less -R'
