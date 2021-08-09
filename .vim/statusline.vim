" Statusline settings to display file information

set laststatus=2        " Show statusline

set statusline=
set statusline+=[%n]
set statusline+=\  
set statusline+=%{StatuslineMode()}
set statusline+=\ 
set statusline+=%f
set statusline+=%m
set statusline+=\ 
set statusline+=%{b:gitbranch}
set statusline+=%=
set statusline+=%{strlen(&fenc)?&fenc:'none'}
set statusline+=\ 
set statusline+=%y
set statusline+=\ 
set statusline+=%3p%%
set statusline+=\ (
set statusline+=%2l
set statusline+=,
set statusline+=%2c
set statusline+=)\ 

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL  "
  elseif l:mode==#"v"
    return "VISUAL  "
  elseif l:mode==#"V"
    return "VISUAL-L"
  elseif l:mode==#"\<C-V>"
    return "VISUAL-B"
  elseif l:mode==#"i"
    return "INSERT  "
  elseif l:mode==#"R"
    return "REPLAC E"
  elseif l:mode==?"s"
    return "SELECT  "
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND "
  elseif l:mode==#"!"
    return "SHELL   "
  endif
endfunction

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
      endif
    catch
    endtry
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

