call pathogen#runtime_append_all_bundles()

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
set wildignore+=*.pyc,*.o,*.class

autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red


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
let mapleader="."

" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
map <silent> <Leader>nt :NERDTreeToggle<CR>
map <silent> <Leader>nr :NERDTree<CR>
map <silent> <Leader>nf :NERDTreeFind<CR>


map <silent> <Leader>ww :wincmd w<CR>

"vimux
let g:VimuxUseNearestPane = 1
map <silent> <Leader>vp :VimuxPromptCommand<CR>
map <silent> <Leader>rl :wa<CR> :VimuxRunLastCommand<CR>
map <silent> <Leader>vi :wa<CR> :VimuxInspectRunner<CR>
map <silent> <Leader>vk :wa<CR> :VimuxInterruptRunner<CR>
map <silent> <Leader>vx :wa<CR> :VimuxClosePanes<CR>


"CommandT
" CommandT
map <silent> <leader>ff :CommandT<CR>
map <silent> <leader>fb :CommandTBuffer<CR>
map <silent> <leader>fr :CommandTFlush<CR>


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

