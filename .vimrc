syntax on

set runtimepath^=~/.vim/

imap <Insert> <Nop>

"remove auto comment after comment line
set formatoptions-=or

set noerrorbells
set vb t_vb=
"highlight search
set hlsearch

"imap <C-i> <esc>l
set number
"set relativenumber
"set mouse=nc
set mouse=""
set ignorecase
set nowrap
nnoremap <Space> @q
nnoremap / H/
set tabstop=2

"clean blank lines
command! Clean :%s/^\s*$//g

vnoremap // y/<C-R>"<CR>

"if launch without filename, enter insert mode
if @% == "" 
	:startinsert
endif

"leader
let mapleader = "-"
let maplocalleader = "="

nnoremap <C-_> gcc
augroup comments
  autocmd!
  autocmd FileType python setlocal commentstring=#\ %s
  autocmd FileType cong setlocal commentstring=#\ %s
  autocmd FileType tex setlocal commentstring=%\ %s
  autocmd FileType sh setlocal commentstring=#\ %s
  autocmd FileType vim setlocal commentstring=\"\ %s
  autocmd FileType conf setlocal commentstring=#\ %s
  autocmd FileType cpp setlocal commentstring=//\ %s
augroup END

"autocommands
augroup testgroup
  autocmd!
  autocmd ColorScheme * highlight WhiteSpaces gui=undercurl guifg=LightGray | match WhiteSpaces / \+/ 
  autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
  autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
  autocmd FileType python iabbrev iff if:<left>
  autocmd FileType python set expandtab
  autocmd FileType python set expandtab
  "c
  autocmd FileType c iabbrev iff if ()<left>
  "bash
  autocmd FileType bash nnoremap <buffer> <localleader>c I#<esc>
  "tex
  autocmd FileType tex setlocal wrap
  autocmd FileType tex setlocal spell
  autocmd FileType tex iabbrev 1pic \includegraphics[width=1\textwidth]{}<left>
  autocmd FileType tex iabbrev 1table \resizebox{0.7\textwidth}{!}{\Huge\begin{tabular}{\|r\|r\|r\|r\|r\|r\|r\|r\|r\|}\hline<cr><cr>\end{tabular}}<esc><up>i<space>
  autocmd FileType tex iabbrev 1item \begin{itemize}<cr>  \item<cr>\end{itemize}<esc><<<up>A
  autocmd FileType tex iabbrev 1frame \begin{frame}<cr>\frametitle{}<cr>\end{frame}<esc><up>$ci}
  autocmd FileType tex iabbrev 1col \begin{columns}<cr>\column{.5\textwidth}<cr>\column{.5\textwidth}<cr>\end{columns} <esc><up>$ci
  autocmd FileType tex iabbrev 1resize \resizebox{0.9\textheight}{!}{\vbox{%start of resize box<cr>}}%end of resize box <esc><up>$ci
  autocmd FileType tex iabbrev 1blu {\color{blue}}<esc>i
  autocmd FileType tex iabbrev 1red {\color{red}}<esc>i
  autocmd FileType tex iabbrev 1eta $\|\eta\|$<left>
  autocmd FileType tex iabbrev 1v \vspace{cm}<left><left><left>
  autocmd FileType tex nnoremap <buffer> <localleader>c I%<esc>
  autocmd BufNewFile,BufRead *.html setlocal nowrap
  autocmd FileType text setlocal wrap
  autocmd FileType text setlocal spell
augroup END

"operator remaps
onoremap p i(
onoremap b i{
onoremap s i[
onoremap " i"
onoremap ' i'
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
"change next brackets!
onoremap n{ :<c-u>execute "normal! /{\r:nohlsearch\rlvi{"<cr>
onoremap n( :<c-u>execute "normal! /(\r:nohlsearch\rlvi("<cr>
"for latex, change in $
onoremap i$ :<c-u>normal! T$vt$"<cr>

"map to replace word with yanked, then restore clipboard
nnoremap <leader>w :<c-u>let @t=getreg('"')<cr>viw"dd"tP:<c-u>let @"=getreg('t')<cr>

"remove highlight
nnoremap <leader>hh :/^[.\+]<cr>


"shortcuts
"nnoremap <leader>_ ddp
"nnoremap <leader>- ddkP
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"for latex, change in $

"iabbrev
iabbrev @@ aaronsw@umich.edu
iabbrev llist \begin{enumerate}<cr>\item<cr>\end{enumerate}<esc>0ki<tab><esc>A

"statusline
set statusline+=%r " readonly
set statusline=%f         " Path to the file
set statusline+=\ -\      " Separator
set statusline+=%y        " Filetype of the file
set statusline+=\ -\      " Separator
set statusline+=%=        " seperation between left and right
set statusline+=[%2c]\ %5l/%L "columns, etc


"color line and cursor
"hi CursorLine   term=NONE cterm=NONE ctermbg=lightgrey ctermfg=NONE 
"set cursorline
hi CursorLineNr term=bold ctermfg=Red gui=bold guifg=Yellow

set laststatus=2
"set cindent
set shiftwidth=2
set smartindent
"set autoindent
inoremap # X#


"paste from last COPIED register
"nnoremap p "0p 
"nnoremap P "0P
nnoremap j gj
nnoremap k gk
set relativenumber
"nnoremap <C-P> :set invpaste paste? \| :set invnumber number? \| :set invrelativenumber relativenumber? \| :call ToggleMouse()<CR><CR>
nnoremap <C-P> :set invpaste paste? \| :set invnumber number? \| :set invrelativenumber relativenumber? <CR><CR>
nnoremap <F10> :set invpaste paste? \| :set invnumber number? \| :set invrelativenumber relativenumber? <CR><CR>


augroup NO_CURSOR_MOVE_ON_SELECTION
  au!
  au MenuPopup * let g:oldmouse=&mouse | set mouse=
  au CursorMoved * if exists('g:oldmouse') | let &mouse=g:oldmouse | unlet g:oldmouse | endif
augroup END

"alt smooth scroll
nnoremap <C-U> 15<C-Y>
nnoremap <C-D> 15<C-E>
nnoremap zl 20zl
nnoremap zh 20zh
""smooth scrolling
"function SmoothScroll(up)
"    if a:up
"        let scrollaction=""
"    else
"        let scrollaction=""
"    endif
"    exec "normal " . scrollaction
"    redraw
"    let counter=1
"    while counter<&scroll
"        let counter+=1
"        sleep 6m
"        redraw
"        exec "normal " . scrollaction
"    endwhile
"endfunction
"
"nnoremap <C-U> :call SmoothScroll(1)<Enter>
"nnoremap <C-D> :call SmoothScroll(0)<Enter>
"inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
"inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i
""end smooth scrolling 

"comment function
function! Comment()
  let curCol=col(".")
  let curRow=line(".")
  let commentCommand="i//"
  let unCommentCommand="xx"
  exec "normal ^"
  if getline('.')[col('.')-1]=="/" && getline('.')[col('.')-0]=="/"
    exec "normal " . unCommentCommand
    call cursor(curRow,curCol-2)
  else
    exec "normal " . commentCommand
    call cursor(curRow,curCol+2)
  endif
endfunction

"nnoremap <C-_> :call Comment()<enter>
"end comment function

"edit multiple lines in visual mode
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
"end edit multiple lines in visual mode

"toggle mouse
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'nvc'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=nvc
    endif
endfunc
"end toggle mouse

