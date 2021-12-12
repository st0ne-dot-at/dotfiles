call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
" Initialize plugin system
call plug#end()

set nocompatible

" syntax hl on
syntax on

" convert tabs to spaces
set expandtab

"tabstop width
set tabstop=4

" persisten undo history
if version >= 703
  set undodir=~/.vim_undo
  set undofile
  set undoreload=10000
endif
set undolevels=1000

set noautoindent
set nosmartindent
set ruler
set wrap

set scrolloff=5
set ignorecase
set smartcase
set wildignore+=*.pyc,*.o,*.class,.git,.svn

" 256 color support for gnome-terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
if $TERM == 'xterm'
  set t_Co=256
endif

autocmd InsertEnter * match ExtraTab /\t/
autocmd BufRead,InsertLeave * match ExtraTab /\t/
highlight ExtraTab ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraTab ctermbg=red guibg=red

autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

set number
highlight LineNr ctermfg=243 ctermbg=235 guibg=grey


" Status
set laststatus=2
set statusline=
set statusline+=%<\ " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\ " buffer number, and flags
set statusline+=%-40f\ " relative path
set statusline+=%= " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\ " file type
set statusline+=%10(L(%l/%L)%)\ " line
set statusline+=%2(C(%v/125)%)\ " column
set statusline+=%P " percentage of file

" mapleader
"let mapleader=","

" restor cursor position
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

inoremap <c-k> <Up>
inoremap <c-j> <Down>
" vom koarl
set list " show invisible characters
set listchars="" " reset the listchars
set listchars+=tab:▸\ " show tabs as ▸
set listchars+=eol:¬ " show end of line as ¬
set listchars+=trail:. " show trailing spaces as dots
set listchars+=extends:> " show > if the text continues beyond the vim window

" NERDTree plugin specific commands
filetype plugin indent on

" Allow backspace to delete indentation and inserted text
" i.e. how it works in most programs
set backspace=indent,eol,start
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.


" go-vim plugin specific commands
" Also run `goimports` on your current file on every save
" Might be be slow on large codebases, if so, just comment it out
let g:go_fmt_command = "goimports"

" Status line types/signatures.
let g:go_auto_type_info = 1

"au filetype go inoremap <buffer> . .<C-x><C-o>

" If you want to disable gofmt on save
" let g:go_fmt_autosave = 0


" NERDTree plugin specific commands
:nnoremap <C-g> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree


" air-line plugin specific commands
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

set autowrite

colo pablo

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
