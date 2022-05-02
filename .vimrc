"
" Vim Settings
"

" Vundle settings
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'jpalardy/vim-slime'
"Plugin 'christoomey/vim-tmux-navigator'
call vundle#end()            " required
filetype plugin indent on    " required

" Regular settings
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
set colorcolumn=81      " Line limiting column.

colorscheme predawn     " Sublime alike color scheme.

"inoremap {<CR> {<CR>}<ESC>O|        " Open curly: newline + close.
"inoremap [<CR> [<CR>]<ESC>O|        " Open bracket: newline + close.

nnoremap <silent> <C-l> <c-w>l|     " Remap split window navigation.
nnoremap <silent> <C-h> <c-w>h
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-j> <c-w>j

" Vim hard mode
noremap h <NOP>
"noremap j <NOP>
"noremap k <NOP>
noremap l <NOP>

map q <Nop>|            " Delete recording option

set foldmethod=syntax       " Folding method, indent for Python, rest syntax.
set foldlevel=0             " Open file with folds closed.

" Python syntax
let g:python_highlight_builtins = 1
let g:python_highlight_func_calls = 1
let g:python_highlight_string_format = 1
let g:python_highlight_string_formatting = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_exceptions = 1
let g:python_highlight_operators = 1

" Code running mapping to key <F5> depending on filetype
autocmd filetype r nmap <F5> :w <bar> exec '!clear && Rscript '.shellescape('%')<CR>
autocmd filetype r imap <F5> <esc>:w<bar> exec '!clear && Rscript '.shellescape('%')<CR>

autocmd filetype python nmap <F5> :w<bar> exec '!clear && python3 '.shellescape('%')<CR>
autocmd filetype python imap <F5> <esc>:w<bar> exec '!clear && python3 '.shellescape('%')<CR>

autocmd filetype julia nmap <F5> :w<bar>exec '!clear && julia '.shellescape('%')<CR>
autocmd filetype julia imap <F5> <esc>:w<bar> exec '!clear && julia '.shellescape('%')<CR>

autocmd filetype tex nmap <F5> :w <bar> exec '!clear && pdflatex '.shellescape('%')<CR>
autocmd filetype c nmap <F5> :w <bar> exec '!clear && make '.shellescape('%:r').'&& ./'.shellescape('%:r')<CR>

" Load files settings
source ~/.vim/statusline.vim



let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
