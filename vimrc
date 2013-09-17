set modeline "look for vim directives in code file
call pathogen#infect() "call pathogen to easy configuration extension

filetype on
filetype plugin indent on

if &diff
    syntax off "colouring on
    colorscheme calmar256-dark
else
		syntax on "colouring on
		colorscheme blackboard
endif

set cursorline "highlight whole line with cursor (in colours define below)
highlight CursorLine ctermbg=darkgray 
set ruler "show current positon of the cursor
" set cursorcolumn
"not to show but to remember
"
set number "show line numbers
set showmatch "show matching bracket
set laststatus=2 "show status line for each window
set hlsearch "highlight search results

set mouse=a 
set mousem=extend 
  
set tabstop=2
set softtabstop=2 "for delete/backspace
set shiftwidth=2
"set expandtab MOVE to python
"set cindent "smart indent
set smartindent "smart indent
set autoindent

" Folding
set foldmethod=indent
set foldlevel=99


" MOVE AROUND
map <A-DOWN> gj
map <A-UP> gk
imap <A-UP> <ESC>gki
imap <A-DOWN> <ESC>gji
" in help
nmap <buffer> <CR> <C-]>
nmap <buffer> <BS> <C-T>
" to help
:map <F1> <ESC>:exec "help ".expand("<cWORD>")<CR>
" to file under cursor
:map gf :edit <cfile><CR>

"KASOWANIE                                                                                                                                                                                     
inoremap <bs> <c-g>u<bs>
inoremap <cr> <c-g>u<cr>
inoremap <del> <c-g>u<del>
inoremap <c-w> <c-g>u<c-w>

map <C-F2> :set et<CR>
map <F2> :if &number<Bar> set nonumber<Bar>else<Bar>set number<Bar>endif<CR>
map <F3> :if exists("syntax_on") <Bar> syntax off <Bar> else <Bar>syntax on <Bar> endif<CR>
"map <F4> :if &g:syntastic_enable_higlighting==1<Bar>let g:syntastic_enable_highlighting = 0<Bar>else<Bar>ley g:syntastic_enable_highlighing = 1 <Bar> endif<CR>
"map <F4> :SyntasticCheck<CR>
map <F5> :if &hlsearch<Bar> set nohlsearch<Bar>else<Bar>set hlsearch<Bar>endif<CR>


" SPELLING
set spellsuggest=15 
set spelllang=en

map <F6> :if &spell<Bar> set nospell<Bar>else<Bar>set spell<Bar>endif<CR>
map <C-F6> :if &spelllang==en<Bar> set spl=pl spell<Bar>else<Bar>set spl=en<Bar>endif<CR>
map <F7> :set spell!<CR><Bar>: echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

let g:pep8_map='<leader>8'

map ,# :s/^/#/<CR>

"set statusline=%f,\ %m%r%y%w:,\ col=%d,\ line=%l/%L\ %p%%,\ time=%{localtime()} 
