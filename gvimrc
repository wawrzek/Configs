::q::if &diff
		syntax off "colouring on
		colorscheme calmar256-dark
else
		syntax on "colouring on
		colorscheme ChocolatePapaya
endif
autocmd BufLeave *.txt colorscheme ChocolatePapaya
autocmd BufLeave *.json colorscheme ChocolatePapaya

set guifont=Terminus
