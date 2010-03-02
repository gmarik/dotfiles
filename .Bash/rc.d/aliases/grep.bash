alias ?='\grep -i'
alias ??='? -nR'
# grep results recursively into editor
alias ?E='f () { A=($@); A[1]=${A[1]:-./}; ?? ${A[@]} |E - ; }; f '
