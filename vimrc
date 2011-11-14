set modeline "look for vim directives in code file

syntax on "colouring on
colorscheme desert256 

set ruler "show current positon of the cursor
set number "show line numers
set showmatch "show matching bracket
set laststatus=2 "show status line for each window
set hlsearch "highlight search results

set mouse=a 
set mousem=extend 
  
set tabstop=4
set shiftwidth=4
set noexpandtab
set nosmartindent
set cindent

"KASOWANIE                                                                                                                                                                                     
inoremap <bs> <c-g>u<bs>
inoremap <cr> <c-g>u<cr>
inoremap <del> <c-g>u<del>
inoremap <c-w> <c-g>u<c-w>

map <C-F2> :set et<CR>
map <F2> :if &number<Bar> set nonumber<Bar>else<Bar>set number<Bar>endif<CR>
map <F3> :if exists("syntax_on") <Bar> syntax off <Bar> else <Bar>syntax on <Bar> endif<CR>
map <F4> :if &hlsearch<Bar> set nohlsearch<Bar>else<Bar>set hlsearch<Bar>endif<CR>
map <F5> :if &spell<Bar> set nospell<Bar>else<Bar>set spell<Bar>endif<CR>
map <C-F5> :if &spelllang=="en"<Bar> set spl=pl spell<Bar>else<Bar>set spl=en<Bar>endif<CR>
map <F6> :set spell!<CR><Bar>: echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
