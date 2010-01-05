alias G='git'
# allow git-completion to work with alias either
complete -o default -o nospace -F _git G

#Git dotfiles
alias Gdf="G --work-tree=$HOME --git-dir=$HOME/dotfiles.git"
