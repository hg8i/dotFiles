scriptencoding utf-8
syntax on


" Change spelling underline color
hi clear SpellBad
hi SpellBad cterm=underline ctermbg=8

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
" remap 0 to be faster
nnoremap 0 hhll0

"clean blank lines
command! Clean :%s/^\s*$//g | :normal <C-O>

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
    autocmd FileType make setlocal commentstring=#\ %s
    autocmd FileType cong setlocal commentstring=#\ %s
    autocmd FileType text setlocal commentstring=#\ %s
    autocmd FileType text syntax off
    autocmd FileType tex setlocal commentstring=%\ %s
    autocmd FileType sh setlocal commentstring=#\ %s
    autocmd FileType vim setlocal commentstring=\"\ %s
    autocmd FileType conf setlocal commentstring=#\ %s
    autocmd FileType cpp setlocal commentstring=//\ %s
augroup END

augroup STACK 
	autocmd!
	" autocmd FileType python let b:pythonThreePrintOn=1
	autocmd BufRead,BufNewFile *.stack setfiletype stack
	autocmd BufRead,BufNewFile *.stack set nospell
	" indentation (use tabs):
	autocmd BufRead,BufNewFile *.stack setlocal ts=4 sts=4 sw=4
augroup END

" ####################### python 3 print
augroup PYTHON 
	autocmd!
	" autocmd FileType python let b:pythonThreePrintOn=1
	autocmd BufRead,BufNewFile *.py3 setfiletype python
	autocmd InsertLeave *py3 call PythonThreePrint() 
augroup END

fun! PythonThreePrint()
	" update print statement to python 3
	" regex to match python2 print statements: ^\s*print\( (\|(\|\a\)\@!

	" if line under cursor has python2 style print
	let line = getline('.')
	if line =~# '^\s*print\( (\|(\|\a\)\@!'
		" record current cursor pos
		let curCol=col(".") 
		let curRow=line(".") 
		" let char=matchstr(getline('.'), '\%' . col('.') . 'c.') " not needed
		" get line under cursor to buffer z
		" let line = getline('.')
		" wrap print in parens ()
		execute "normal! ^ftl"
		execute "normal! r(g_a)"
		call cursor(curRow,curCol+1)
		return 1
	endif
	return 0
endfun
" ####################### python 3 print




"autocommands
augroup testgroup
    autocmd!
    " autocmd ColorScheme * highlight WhiteSpaces gui=undercurl guifg=LightGray | match WhiteSpaces / \+/ 
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
    autocmd FileType tex iabbrev 1table \resizebox{0.7\textwidth}{!}{\Huge\begin{tabular}{\|r\|r\|r\|r\|r\|r\|r\|r\|r\|}\hline<cr><cr>\hline\end{tabular}}<esc><up>i<space>
    autocmd FileType tex iabbrev 1item \begin{itemize}<cr>    \item<cr>\end{itemize}<esc><<<up>A
    autocmd FileType tex iabbrev 1frame \begin{frame}<cr>\frametitle{}<cr>\end{frame}<esc><up>$ci}
    autocmd FileType tex iabbrev 1col \begin{columns}<cr>\column{.5\textwidth}<cr>\column{.5\textwidth}<cr>\end{columns} <esc><up>
    autocmd FileType tex iabbrev 1resize \resizebox{0.9\textheight}{!}{\vbox{%start of resize box<cr>}}%end of resize box <esc><up>$ci
    autocmd FileType tex iabbrev 1scale \scalebox{0.8}{\begin{minipage}{1.20\textwidth} % start of scalebox <cr>\end{minipage}} % stop of scalebox
    autocmd FileType tex iabbrev 1cb {\color{blue}}<esc>i
    autocmd FileType tex iabbrev 1cg {\color{green}}<esc>i
    autocmd FileType tex iabbrev 1cr {\color{red}}<esc>i
    autocmd FileType tex iabbrev 1cy {\color{yellow}}<esc>i
    autocmd FileType tex iabbrev 1co {\color{orange}}<esc>i
    autocmd FileType tex iabbrev fb1 $fb-1$
    autocmd FileType tex iabbrev 1eta $\|\eta\|$<left>
    autocmd FileType tex iabbrev 1v \vspace{cm}<left><left><left>
    " autocmd FileType tex iabbrev 1h \noindent\rule{cm}{0.4pt}<left><left><left><left><left><left><left><left><left><left>
    autocmd FileType tex iabbrev 1draw \begin{tikzpicture}[remember picture,overlay]\end{tikzpicture}% use 1trect, 1tcirc, 1tnode, 1tpath, options: [red, rotate=90, fill=green, rounded corners=2pt], \draw [->] (A) edge (B) <esc>$F\i
    autocmd FileType tex iabbrev 1trect \draw[white,fill=white] (0.5\textwidth,0.5\textheight)rectangle(4cm,3.7cm);
    autocmd FileType tex iabbrev 1tcirc \draw[red,ultra thick] (0.5\textwidth,0.5\textheight)circle(0.3cm);
    autocmd FileType tex iabbrev 1tpath \draw[->, red,ultra thick] (A) edge (B);
    autocmd FileType tex iabbrev 1tnode \node (A) at (0.5\textwidth,0.5\textheight) {}; 
    autocmd FileType tex iabbrev 1box \cfbox{red}{}<left>
    autocmd FileType tex iabbrev 1text \begin{textblock*}{1cm}(0.50\paperwidth,0.50\paperheight)<cr>\end{textblock*}
    autocmd FileType tex iabbrev 1s $\sigma$
    autocmd FileType tex iabbrev 1h $H\to\mu\mu$
    autocmd FileType tex nnoremap <buffer> <localleader>c I%<esc>
    autocmd BufNewFile,BufRead *.html setlocal nowrap
    autocmd FileType text setlocal wrap
    autocmd FileType text setlocal spell

    " stack commands
    " command to make new day entry
    autocmd FileType stack command! InsertDate :exec "normal O==== " . system("date +%d%m%y") . "* " . system("date +%H%M | tr -d '\n'") . ": "

    autocmd FileType stack nnoremap <localleader>d :exec "<c-u>InsertDate<cr>" \| k
    " command to make new time entry
    autocmd FileType stack command! InsertTime :exec "normal O* " . system("date +%H%M | tr -d '\n'") . ": "
    autocmd FileType stack nnoremap <localleader>t :exec "<c-u>InsertTime<cr>" \| k
augroup END

" function! InsertDate()
"     exec "normal i" . system("date +%d%m%y")
" endfunction

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
" highlight color


"shortcuts
"nnoremap <leader>_ ddp
"nnoremap <leader>- ddkP
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr> : colo darkRotationCurve<cr>
"for latex, change in $

"iabbrev
iabbrev @@ aaronsw@umich.edu
iabbrev llist \begin{enumerate}<cr>\item<cr>\end{enumerate}<esc>0ki<tab><esc>A

"statusline
set statusline+=%r " readonly
set statusline=%f               " Path to the file
set statusline+=\ -\      " Separator
set statusline+=%y        " Filetype of the file
set statusline+=\ -\      " Separator
set statusline+=%=        " seperation between left and right
set statusline+=[%2c]\ %5l/%L "columns, etc


"color line and cursor
"hi CursorLine   term=NONE cterm=NONE ctermbg=lightgrey ctermfg=NONE 
" set cursorline
" hi CursorLineNr term=bold ctermfg=222 gui=bold guifg=blue
" hi Search cterm=NONE ctermfg=052 ctermbg=blue " good
" colorscheme evening
set cursorline
" set background=dark
" let g:gruvbox_hls_cursor='neutral_blue'
" colorscheme gruvbox
" colorscheme orange-moon

set laststatus=2
"set cindent
inoremap # X#

" paste to end of line: gp
nnoremap gp $p

"paste from last COPIED register
"nnoremap p "0p 
"nnoremap P "0P
nnoremap j gj
nnoremap k gk
set relativenumber
"nnoremap <C-P> :set invpaste paste? \| :set invnumber number? \| :set invrelativenumber relativenumber? \| :call ToggleMouse()<CR><CR>
nnoremap <C-P> :set invpaste paste? \| :set invnumber number? \| :set invrelativenumber relativenumber? \| :set invwrap wrap?<CR><CR>
nnoremap <F10> :set invpaste paste? \| :set invnumber number? \| :set invrelativenumber relativenumber? \| :set invwrap wrap?<CR><CR>


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

" white space show up (https://www.youtube.com/watch?v=aHm36-na4-4&feature=youtu.be#t=4m59s)
" uses unicode:
" exec "set listchars=tab:\\|_,trail:\uB7,nbsp:~"
" uses no unicode
exec "set listchars=tab:\\|_,nbsp:_,trail:_"
set list

" tab behavior
set ts=4 sts=4 sw=4 et
set smartindent
"set autoindent

" Set colorscheme AFTER reading the file, so that it gets the filetype
augroup COLOR
    autocmd BufRead,BufNewFile * colo darkRotationCurve
augroup END

