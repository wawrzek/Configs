" Setup vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"Plug 'tpope/vim-sensible'
Plug 'dense-analysis/ale'
Plug 'pearofducks/ansible-vim'
Plug 'preservim/nerdtree'
Plug 'tmhedberg/SimpylFold'
" Languges
Plug 'towolf/vim-helm'
Plug 'andrewstuart/vim-kubernetes'
Plug 'plasticboy/vim-markdown'
Plug 'hashivim/vim-terraform'
" Colours
Plug 'michaelmalick/vim-colors-bluedrake'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
call plug#end()

" Store Backup files
set backup
set backupdir=~/.vim/backup//
" Store UnDo files
set undofile
set undodir=~/.vim/undo//
" Store swap files
set directory=~/.vim/swap//

" Start NERDTree when Vim is started without file arguments or with a directory.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) | execute 'cd' fnameescape(argv()[0]) | NERDTree | execute 'only' | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Enable filetypes
filetype on
filetype plugin indent on
set modeline "look for vim directives in code file

" Set colours
set t_Co=256

set background=dark
map <leader>b :if &background=='dark'<Bar>set background=light<Bar>else<Bar>set background=dark<Bar>endif<CR>

if &diff
  syntax off
  colorscheme calmar256
else
  syntax on
  if hostname() == 'titan'
    colorscheme gruvbox
  else
    colorscheme bluedrake
  endif
endif


match errorMsg /\s$/

set ruler "show current position of the cursor
set number "show line numbers
set showmatch "show matching bracket
set laststatus=2 "show status line for each window

set hlsearch "highlight search results
map <leader>i :if &ic<Bar>set noic<Bar>else<Bar>set ic<Bar>endif<CR>

set mouse=a
set mousem=extend

set tabstop=4			" tab = 4 spaces
set softtabstop=2		" for delete/backspace
set shiftwidth=2		" for '>' '<'
set expandtab			" Switch lower
set autoindent

" Folding
"set foldmethod=indent
"set foldlevel=99

" show invisibles
set listchars=tab:▸\ ,eol:¬,trail:_,nbsp:+,extends:>,precedes:<,

" move around
map <A-DOWN> gj
map <A-UP> gk
imap <A-UP> <ESC>gki
imap <A-DOWN> <ESC>gji
" in help
nmap <buffer> <CR> <C-]>
nmap <buffer> <BS> <C-T>
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
hi SpellBad cterm=reverse

" ============
" Shortcuts
" ----------
"  Leader +
"  on/off switching
"   - tab expansion
nnoremap <leader>e :set expandtab!<CR>:set expandtab?<CR>
"   - non-printable characters
nnoremap <leader>l :set list!<CR>:set list?<CR>
"   - Highlight Search
nnoremap <leader>h :set hlsearch!<CR>:set hlsearch?<CR>
"   -  spelling
nnoremap <leader>s :set spell!<CR>:set spell?<CR>
" changing language (PL/EN)
nnoremap <leader>S :let &spelllang = (&spl=='en' ? 'pl' : 'en')<Bar>set spl?<Bar>set spell<CR>
"
" ----------
"  Fx keys
" F1 - Help
:map <F1> <ESC>:exec "help ".expand("<cWORD>")<CR>
" F2 - Toggle NERDTree
nnoremap <F2> :NERDTreeToggle<CR>
" F3 - Toggle Numbers lines
map <F3> :if &number<Bar> set nonumber<Bar>else<Bar>set number<Bar>endif<CR>
" F3+Ctrl - Toggle Syntax
map <C-F3> :if exists("syntax_on") <Bar> syntax off <Bar> else <Bar>syntax on <Bar> endif<CR>


" Check this shortcut
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

" --------
" To check
let g:pep8_map='<leader>8'
"map <Esc> :noh<cr>
map ,# :s/^/#/<CR>

let g:go_disable_autoinstall = 1
" --------
"

" Various other settings
" Titan from the remote machine
"   $SSH_CLIENT=~"192.168.178.87"
" Colours
"autocmd BufEnter *.txt colorscheme morning
"autocmd BufLeave *.txt colorscheme blackboard
"autocmd BufEnter *.json colorscheme blackboard
"set cursorline "highlight whole line with cursor (in colours define below)
"highlight CursorLine ctermbg=darkgray
" set cursorcolumn
"
"set statusline=%f,\ %m%r%y%w:,\ col=%d,\ line=%l/%L\ %p%%,\ time=%{localtime()}
"
