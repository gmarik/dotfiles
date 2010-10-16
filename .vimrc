if filereadable(expand("~/.vim/vimrc"))
  source ~/.vim/vimrc
endif

if filereadable(expand("~/.vim/vimrc.local"))
  source ~/.vim/vimrc.local
endif
