"let g:solarized_style="dark"
"let g:solarized_termcolors=16
"let g:solarized_termtrans=1
"set background=dark

"backspace before cursor
set backspace=2

"set the titlebar when editing a file
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}
set title

syntax on
colorscheme default
set scrolloff=5     " Keep 5 lines (top/bottom) for scope
set sidescrolloff=5 " Keep 5 lines at the size
set hlsearch        " highlight search results
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o    " Turn off autocommenting
autocmd BufRead,BufNew *.md set filetype=markdown " highlight .md files as markdown
"set paste           " set paste behavior by default
"set number         " Show line numbers on the left

"highlight columnns > 79 for good coding style
"let &colorcolumn=join(range(80,9999),",")

map <F3> !}fmt<CR>  " Format Paragraph

map <F4> :w:!aspell check % :e!

" filetype plugin on

" set markdown folding levels
function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "="
endfunction

au BufEnter *.md setlocal foldexpr=MarkdownLevel()
au BufEnter *.md setlocal foldmethod=expr
