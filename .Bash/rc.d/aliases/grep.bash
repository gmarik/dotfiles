alias ?='\grep -i'
alias ??='? -nR'
# grep results recursively into editor
alias ?e='f () { A=($@); A[1]=${A[1]:-./}; ?? ${A[@]} |e - ; }; f '
