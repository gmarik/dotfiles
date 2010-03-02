RCDIR=/etc/rc.d/

_rc_service()
{
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  local root=$RCDIR
  local items=$(ls -1 $root)

  COMPREPLY=($(compgen -W "${items}" -- "${cur}"))
}

rc()
{
 sudo -p 'sudo password:' $RCDIR/$1 $2
}

complete -F _rc_service rc
