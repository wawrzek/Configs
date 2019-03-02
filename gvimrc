if &diff
		syntax off "colouring on
		colorscheme calmar256-dark
else
		syntax on "colouring on
		colorscheme ChocolatePapaya
endif
autocmd BufEnter *.tf colorscheme dante
autocmd BufLeave *.tf colorscheme ChocolatePapaya
autocmd BufEnter *.txt colorscheme morning
autocmd BufLeave *.txt colorscheme ChocolatePapaya
autocmd BufEnter *.json colorscheme blackboard
autocmd BufLeave *.json colorscheme ChocolatePapaya

if has('gui_macvim')
	set guifont=TerminusTTF:h16
else
	set guifont=Terminus\ 16
endif
