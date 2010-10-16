if filereadable(expand("~/.vim/vimrc"))
  source ~/.vim/vimrc
endif
"
if has("gui_running") && filereadable(expand("~/.vim/gvimrc"))
    source ~/.vim/gvimrc
endif

if filereadable(expand("~/.vim/vimrc.local"))
  source ~/.vim/vimrc.local
endif
