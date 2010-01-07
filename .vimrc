" NEW STUFF: http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/225852#225852
" Shortcuts to quit the Insert mode:
"
"Ctrl-c " "quit Insert mode (faster than ESC)
"Ctrl-o " "quit insert mode just for the time of one command
"CTRL-o + I, or CTRL-o + 0 " "quit insert mode, go at beginning of line, and go back to insert mode
"CTRL-o + A, or CTRL-o + $ " "quit insert mode, go at end of line, and go back to insert mode
"
"
syntax on " enable syntax
filetype on  " Automatically detect file types.
filetype plugin on
filetype indent on

" General
set nocompatible  " disable vi compatibility.

" configuration
set modeline
set modelines=5 " default numbers of lines to read for modeline instructions

" Matching and searchin
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase		" be sensitive when there's a capital letter
set incsearch   "

" Buffers
set hidden " The current buffer can be put to the background without writing to disk

set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

"" Formatting
set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)
"
" Indent options
set cindent
set autoindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case
"
" Line wrapping
set nowrap
set textwidth=0		" Don't wrap lines by default

" Backspace 
set backspace=indent,eol,start	" more powerful backspacing
"
" Tabs and spaces
set tabstop=2    " Set the default tabstop
set shiftwidth=2 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels
set list " Display unprintable characters
set listchars=tab:·\ ,eol:↲,trail:·,extends:>,precedes:< " Unprintable chars mapping

" Visual
set nonumber  " Line numbers off
set showmatch  " Show matching brackets.
set matchtime=5  " Bracket blinking.
set novisualbell  " No blinking
set noerrorbells  " No noise.
set laststatus=0  " Always show status line.
set ruler  " Show ruler
set showcmd " Display an incomplete command in the lower right corner of the Vim window
set shortmess=atI " Shortens messages
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.
"
" Color Themes
" colorscheme vividchalk
" colorscheme darkblue
" TODO:
"colorscheme desert
colorscheme gmarik

" Mouse
set mouse-=a " Disable mouse
set mousehide  " Hide mouse after chars typed


" Backup
set nobackup
set writebackup
set backupdir=~/.backup,/tmp
set directory=~/.backup,/tmp

" For our local plugins and files
set runtimepath+=~/.vim

" KEY MAPPING:
" .vimrc
nnoremap <silent> <LocalLeader>rs :source ~/.vimrc<CR>
nnoremap <silent> <LocalLeader>re :e ~/.vimrc<CR>
nnoremap <silent> <LocalLeader>rt :tabnew ~/.vimrc<CR>

nnoremap <silent> <S-Insert> "+p
"TODO:
"inoremap <silent> <ESC>"+p i

" Tabs
nnoremap <C-W><C-T> :tabnew<CR>
nnoremap <C-W><C-T> :tabnew<CR>
nnoremap <silent> <LocalLeader>[ :tabprev<CR>
nnoremap <silent> <LocalLeader>] :tabnext<CR>

" Duplication
vnoremap <silent> <LocalLeader>= yP
nnoremap <silent> <LocalLeader>= YP


"Selection searc
vnoremap / y/<C-R>"<CR>N

" Line splitting
nnoremap <silent> <C-J> gEa<CR><ESC>ew "Split line(opposite to S-J - joining line) 

" Folding with SimpleFold
map <unique> <silent> <LocalLeader>- <Plug>SimpleFold_Foldsearch

"remap forward|backward-search-word-under-cursor to stay on the keyword and highlight it 
" movement: n (up) or N (down)
nmap # #N " strict highlight: delimited word
nmap * "ayiw/<C-r>a<CR> " loose highlight: maybe a part of 

map <S-CR> A<CR><ESC>
"TODO: doesnt work
"map <C-s> :w<CR>
" Control+S and Control+Q are flow-control characters: disable them in your terminal settings.
" $ stty -ixon -ixoff
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>



" FuzzyFinder 
nnoremap <silent> <LocalLeader>h :FufHelp<CR>

nnoremap <silent> <F2> :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <S-F2> :FufFile<CR>
nnoremap <silent> <F3> :FufBuffer<CR>
nnoremap <silent> <F4> :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> <S-F4> :FufDir<CR>
nnoremap <silent> <F5> :FufChangeList<CR>
nnoremap <silent> <F6> :FufMruFile<CR>
nnoremap <silent> <F7> :FufLine<CR>
nnoremap <silent> <F8> :FufBookmark<CR> 
nnoremap <silent> <S-F8> :FuzzyFinderAddBookmark<CR><CR>
nnoremap <silent> <F9> :FufTaggedFile<CR> 

let g:fuf_modesDisable = []

"
" Misc
set pastetoggle=<F10> "  toggle between paste and normal: for 'safer' pasting from keyboard
map <silent> <F12> :set invlist<CR>     " show/Hide hidden Chars
map <silent> <LocalLeader>2h :runtime! syntax/2html.vim<CR> " generate HTML version current buffer using current color scheme

if has("autocmd")
  " This section returns to the last place you were in a file
  " When you repoen it. Comment out to disable this behavior
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g'\"" | endif
endif

cmap w!! %!sudo tee > /dev/null % " http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/96492#96492
