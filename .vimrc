"let g:solarized_style="dark"
"let g:solarized_termcolors=16
"let g:solarized_termtrans=1
"set background=dark

"set the titlebar when editing a file
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}
set title

syntax on
colorscheme default
set scrolloff=5     " Keep 5 lines (top/bottom) for scope
set sidescrolloff=5 " Keep 5 lines at the size
set hlsearch        " highlight search results
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o    " Turn off autocommenting
"set paste           " set paste behavior by default
"set number         " Show line numbers on the left

map <F3> !}fmt<CR>  " Format Paragraph

map <F4> :w:!aspell check % :e!

