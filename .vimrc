"
" Vim Settings
"

syntax on               " Activate syntax highlighting.

set autoindent          " Indent according to previous line.
set expandtab           " Use spaces instead of tabs.
set softtabstop=4       " Tab key indents by 4 spaces.
set shiftwidth=4        " >> indents by 4 spaces.

set hidden              " Switch between buffers without save first.
set laststatus=2        " Always show statusline.

set showmode            " Show current mode in command-line.
set showcmd             " Show already typed keys when more are expected.

set incsearch           " Highlight while searching with / or ?.

set showmode            " Show current mode in command-line.
set showcmd             " Show already typed keys when more are expected.

set lazyredraw          " Only redraw when necessary.

set splitbelow          " Open new windows below the current window.
set splitright          " Open new windows right of the current window.

set number              " Line numbering on left side.
set relativenumber      " Relative numbering of lines.

set cursorline          " Find the current line quickly.
set colorcolumn=79      " Line limiting column.

colorscheme predawn     " Sublime alike color scheme.

inoremap {<CR> {<CR>}<ESC>O|     " Open curly: newline + close.
inoremap [<CR> [<CR>]<ESC>O|     " Open bracket: newline + close.

map q <Nop>|            " Delete recording option

set foldmethod=indent       " Folding method, indent for Python, rest syntax.
set foldlevel=20            " Open file with folds closed.

" Python syntax
let g:python_highlight_builtins = 1
let g:python_highlight_func_calls = 1
let g:python_highlight_string_format = 1
let g:python_highlight_string_formatting = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_exceptions = 1
let g:python_highlight_operators = 1
" Define all the different modes

" Code running mapping to key <F5> depending on filetype
autocmd filetype python nnoremap <F5> :w <bar> exec '!clear && python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F5> :w <bar> exec '!clear && make '.shellescape('%:r').'&& ./'.shellescape('%:r')<CR>

" Temporary shortcut for cs50's pset5
autocmd filetype python nnoremap <F2> :w <bar> exec '!clear && python dna.py small.csv 10.txt'<CR>

" Load files settings
source ~/.vim/statusline.vim
