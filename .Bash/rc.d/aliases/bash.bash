alias Brc='e ~/.bashrc && source ~/.bashrc'
alias Bstats='f() { history|cut -d\  -f4-5|sort|uniq -c|sort -rn|head -${1:-30}; }; f'
