
" Setup vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"Plug 'tpope/vim-sensible'
"Plug 'junegunn/seoul256.vim'
Plug 'pearofducks/ansible-vim'
Plug 'hashivim/vim-terraform'
Plug 'michaelmalick/vim-colors-bluedrake'
Plug 'rhysd/vim-grammarous'
Plug 'dense-analysis/ale'
Plug 'udalov/kotlin-vim'
call plug#end()

filetype on
filetype plugin indent on
set modeline "look for vim directives in code file

" Set colours
set t_Co=256
set background=dark
colorscheme bluedrake
map <leader>b :if &background=='dark'<Bar>set background=light<Bar>else<Bar>set background=dark<Bar>endif<CR>

if &diff
	syntax off
	colorscheme calmar256-dark
else
	syntax on
	colorscheme bluedrake
endif

match errorMsg /\s$/

" To remember in the future
"autocmd BufEnter *.txt colorscheme morning
"autocmd BufLeave *.txt colorscheme blackboard
"autocmd BufEnter *.json colorscheme blackboard
"set cursorline "highlight whole line with cursor (in colours define below)
"highlight CursorLine ctermbg=darkgray
" set cursorcolumn
"
set ruler "show current position of the cursor
set number "show line numbers
set showmatch "show matching bracket
set laststatus=2 "show status line for each window

"set statusline=%f,\ %m%r%y%w:,\ col=%d,\ line=%l/%L\ %p%%,\ time=%{localtime()}
"
set hlsearch "highlight search results
map <leader>i :if &ic<Bar> set noic<Bar>else<Bar>set ic<Bar>endif<CR>

set mouse=a
set mousem=extend

set tabstop=2				" tab lenght
set softtabstop=2		" for delete/backspace
set shiftwidth=2		" for '>' '<'
set expandtab			" Need to set noet

"set cindent "smart indent
set smartindent "smart indent
set autoindent

" Folding
set foldmethod=indent
set foldlevel=99

" show invisibles
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬,trail:_

" move around
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

" delete
inoremap <bs> <c-g>u<bs>
inoremap <cr> <c-g>u<cr>
inoremap <del> <c-g>u<del>
inoremap <c-w> <c-g>u<c-w>



" spelling
set spellsuggest=15
set spelllang=en
map <leader>s :if &spell<Bar> setlocal nospell<Bar>else<Bar>setlocal spell<Bar>endif<CR>


" Special characters
map <C-F2> :set et<CR>
map <F2> :if &number<Bar> set nonumber<Bar>else<Bar>set number<Bar>endif<CR>
map <F3> :if exists("syntax_on") <Bar> syntax off <Bar> else <Bar>syntax on <Bar> endif<CR>
"map <F4> :if &g:syntastic_enable_higlighting==1<Bar>let g:syntastic_enable_highlighting = 0<Bar>else<Bar>ley g:syntastic_enable_highlighing = 1 <Bar> endif<CR>
"map <F4> :SyntasticCheck<CR>
"map <F5> :if &hlsearch<Bar> set nohlsearch<Bar>else<Bar>set hlsearch<Bar>endif<CR>
":noremap <leader>h :set hlsearch! <CR>
"map <Esc> :noh<cr>
map <F6> :if &spell<Bar> setlocal nospell<Bar>else<Bar>setlocal spell<Bar>endif<CR>
map <C-F6> :if &spelllang==en<Bar> set spl=pl spell<Bar>else<Bar>set spl=en<Bar>endif<CR>
map <F7> :set spell!<CR><Bar>: echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

let g:pep8_map='<leader>8'

map ,# :s/^/#/<CR>

let g:go_disable_autoinstall = 1

"
" Function to remove white spaces
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
function! <SID>StripTrailingWhitespaces()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	%s/\s\+$//e
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l,c)
endfunction

