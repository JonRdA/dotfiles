" Indentation, tabs & spaces
set expandtab           " tabs are spaces
set softtabstop=4       " number of spaces
set autoindent          " previous line's level
set shiftwidth=4        " tab size for auto indentation


" User interface settings
set number
set colorcolumn=79
set cursorline
colorscheme predawn

" Show command in bottom right bar
set showcmd

" Searching while typing
set incsearch

" Mathing bracket key mappings
inoremap {<CR> {<CR>}<ESC>O
inoremap [<CR> [<CR>]<ESC>O

" Allow for more than one unsaved buffer
set hidden

" Redraw only when needed
set lazyredraw

" Python syntax
let g:python_highlight_builtins = 1
let g:python_highlight_func_calls = 1
let g:python_highlight_string_format = 1
let g:python_highlight_string_formatting = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_exceptions = 1
let g:python_highlight_operators = 1

" Code running mapping to key <F5> depending on filetype
autocmd filetype python nnoremap <F5> :w <bar> exec '!clear && python3 '.shellescape('%')<CR>
autocmd filetype c nnoremap <F5> :w <bar> exec '!clear && make '.shellescape('%:r').'&& ./'.shellescape('%:r')<CR>
