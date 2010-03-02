RP_HOME=~/railsware/rp/

_rp_dir()
{
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  local root=$RP_HOME
  local projects=$(ls -1 $root)

  COMPREPLY=($(compgen -W "${projects}" -- "${cur}"))
}

rp()
{
  cd "$RP_HOME/$1"
}

complete -F _rp_dir rp


## RP
alias cdrp="cd $RP_HOME/rp-badge-signup/"

