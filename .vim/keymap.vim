" Key Mappings "{{{
" .vimrc 
nnoremap <silent> <LocalLeader>rs :source ~/.vimrc<CR>
nnoremap <silent> <LocalLeader>re :e ~/.vimrc<CR>
nnoremap <silent> <LocalLeader>rt :tabnew ~/.vimrc<CR>

nnoremap <silent> <S-Insert> "+p
"TODO:
"inoremap <silent> <ESC>"+p i

" Tabs 
nnoremap <C-W><C-T> :tabnew<CR>
nnoremap <silent> <LocalLeader>[ :tabprev<CR>
nnoremap <silent> <LocalLeader>] :tabnext<CR>
" Duplication 
vnoremap <silent> <LocalLeader>= yP
nnoremap <silent> <LocalLeader>= YP
" Buffers
nnoremap <silent> <LocalLeader>- :bd<CR>
"Selection searc 
vnoremap / y/<C-R>"<CR>N
" Line splitting 
" Split line(opposite to S-J - joining line) 
nnoremap <silent> <C-J> gEa<CR><ESC>ew 
" Folding with SimpleFold
"map <unique> <silent> <LocalLeader>- <Plug>SimpleFold_Foldsearch

"remap forward|backward-search-word-under-cursor to stay on the keyword and highlight it 
" movement: n (up) or N (down)
" strict highlight: delimited word
" loose highlight: maybe a part of 
"nnoremap # #N
nnoremap # :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nmap * "ayiw/<C-r>a<CR>

map <S-CR> A<CR><ESC>
"TODO: doesnt work
"map <C-s> :w<CR>
" Control+S and Control+Q are flow-control characters: disable them in your terminal settings.
" $ stty -ixon -ixoff
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Misc
" show/Hide hidden Chars
map <silent> <F12> :set invlist<CR>     
" generate HTML version current buffer using current color scheme
map <silent> <LocalLeader>2h :runtime! syntax/2html.vim<CR> 

" http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/96492#96492
cmap w!! %!sudo tee > /dev/null % 
" "}}}

