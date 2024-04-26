scriptencoding utf-8
syntax on

set nrformats-=octal

set noswapfile

" Refresh spell check
nnoremap gs :syntax sync fromstart<enter>
nnoremap gss :syntax spell toplevel<enter>


" Change spelling underline color
hi clear SpellBad
hi SpellBad cterm=underline ctermbg=8

set runtimepath^=~/.vim/

" turned on to load files in ftplugin directory
filetype plugin on
set rtp^=~/.vim/ftplugin/

imap <Insert> <Nop>

" fix syntax highlighting

" nnoremap n ]s
" nnoremap N [s
" nnoremap z z=

" remove auto comment after comment line
set formatoptions-=or
set formatoptions-=ro
set formatoptions-=c

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
set smartcase
set incsearch
set nowrap
set scrolloff=1
nnoremap <Space> @q
nnoremap <Tab> @w
" nnoremap / H/
" remap 0 to be faster
nnoremap 0 hhll0
" remap to yank to end on line
nnoremap Y y$

nnoremap K kJ

" Move lines up/down
nnoremap <C-K> :let @x=@"<cr>kddpk:let @"=@x<cr>
nnoremap <C-J> :let @x=@"<cr>ddp:let @"=@x<cr>

"clean blank lines
command! Clean :%s/^\s*$//g | :normal <C-O>

vnoremap // y/<C-R>"<CR>

""if launch without filename, enter insert mode
"if @% == "" 
"    :startinsert
"endif

"leader
let mapleader = "-"
let maplocalleader = "="

setlocal commentstring=#\ %s
augroup comments
    autocmd!
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType make setlocal commentstring=#\ %s
    autocmd FileType cong setlocal commentstring=#\ %s
    autocmd FileType text setlocal commentstring=#\ %s
    autocmd FileType text syntax off
    autocmd FileType tex setlocal commentstring=%\ %s
    autocmd FileType bib setlocal commentstring=%\ %s
    autocmd FileType sh setlocal commentstring=#\ %s
    autocmd FileType vim setlocal commentstring=\"\ %s
    autocmd FileType conf setlocal commentstring=#\ %s
    autocmd FileType cpp setlocal commentstring=//\ %s
    autocmd FileType arduino setlocal commentstring=//\ %s
    autocmd FileType c setlocal commentstring=//\ %s
    autocmd FileType xdefaults setlocal commentstring=!\ %s
    autocmd FileType stack setlocal commentstring=#\ %s
    autocmd FileType xml setlocal commentstring=<!--\ %s\ -->
augroup END
" Comment single line
noremap <C-_> :Commentary<cr>


augroup TEX
    " shorten syntax highlight (good for long lines in latex)
    autocmd FileType tex setlocal synmaxcol=2000
    au FileType tex set autoindent
    au BufRead,BufNewFile *.tex set filetype=tex
augroup END

augroup BIB
    " shorten syntax highlight (good for long lines in latex)
    autocmd FileType btex setlocal synmaxcol=2000
    au FileType bib set autoindent
    au BufRead,BufNewFile *.bib set filetype=bib
augroup END

augroup STACK 
    autocmd!
    " autocmd FileType python let b:pythonThreePrintOn=1
    au FileType *stack set autoindent
    autocmd BufRead,BufNewFile *.stack setfiletype stack
    autocmd BufRead,BufNewFile *.stack set nospell
    " indentation (use tabs):
    " autocmd BufRead,BufNewFile *.stack setlocal ts=4 sts=4 sw=4
augroup END

" ####################### python 3 print
augroup PYTHON 
    autocmd!
    " autocmd FileType python let b:pythonThreePrintOn=1
    autocmd BufRead,BufNewFile *.py3 setfiletype python
    autocmd InsertLeave *py3 call PythonThreePrint() 
    au FileType python set autoindent
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


" From help:
func Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc
" How to use example:
" iabbr <silent> if if ()<Left><C-R>=Eatchar('\s')<CR>


"autocommands
augroup testgroup
    autocmd!
    " autocmd ColorScheme * highlight WhiteSpaces gui=undercurl guifg=LightGray | match WhiteSpaces / \+/ 
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    " autocmd FileType python set expandtab
    " autocmd FileType python set expandtab
    "c
    "bash
    autocmd FileType bash nnoremap <buffer> <localleader>c I#<esc>
    "
    autocmd FileType mail setlocal spell
    autocmd FileType mail setlocal wrap
    "tex
    autocmd FileType tex setlocal wrap
    autocmd FileType tex setlocal spell
    autocmd FileType tex iabbrev 1pic \includegraphics[width=1\textwidth]{}<left>
    " autocmd FileType tex iabbrev 1fig \begin{figure}[htb]<cr>\begin{center}<cr>\includegraphics[width=0.8\linewidth]{figures/}<cr>\end{center}<cr>\vspace{-.4cm}<cr>\caption{}<cr>\label{fig:}<cr>\end{figure}<cr>
    autocmd FileType tex iabbrev 1fig2 \begin{figure}[htp]<cr>\centering<cr>\begin{overpic}[width=0.449\textwidth]{figures/}\put(85,-0.1){\textrm{(a)}}\end{overpic}<cr>\begin{overpic}[width=0.449\textwidth]{figures/}\put(85,-0.1){\textrm{(b)}}\end{overpic}<cr>\caption{}<cr>\label{fig:}<cr>\end{figure}<cr>
    autocmd FileType tex iabbrev 1table \begin{tabular}{l r r r r r}\toprule<cr><cr>\bottomrule\end{tabular} %remember cline{1-2}<esc><up>i<space>
    autocmd FileType tex iabbrev 1item \begin{itemize}<cr>    \item<cr>\end{itemize}<esc><<<up>A
    autocmd FileType tex iabbrev 1items \begin{itemize}\scriptsize<cr>    \item<cr>\end{itemize}<esc><<<up>A
    autocmd FileType tex iabbrev 1enum \begin{enumerate}\scriptsize<cr>    \item<cr>\end{enumerate}<esc><<<up>A
    autocmd FileType tex iabbrev 1frame \begin{frame}<cr>\frametitle{}<cr>\end{frame}<esc><up>$ci}
    autocmd FileType tex iabbrev 1col \begin{columns}[T]<cr>\column{.5\textwidth}<cr>\column{.5\textwidth}<cr>\end{columns} <esc><up>
    autocmd FileType tex iabbrev 1col3 \begin{columns}[T]<cr>\column{.35\textwidth}<cr>\column{.35\textwidth}<cr>\column{.35\textwidth}<cr>\end{columns} <esc><up>
    autocmd FileType tex iabbrev 1col4 \begin{columns}[T]<cr>\column{.25\textwidth}<cr>\column{.25\textwidth}<cr>\column{.25\textwidth}<cr>\column{.25\textwidth}<cr>\end{columns} <esc><up>
    autocmd FileType tex iabbrev 1fig \afterpage{<cr>\begin{figure}[h!]<cr>\captionsetup[subfigure]{position=b}<cr>\centering<cr>\subfloat[][]{{\includegraphics[width=0.5\textwidth]{}}}<cr>\caption{}<cr>\label{fig:}<cr>\end{figure}<cr>\clearpage<cr>}<esc><up>
    autocmd FileType tex iabbrev 1tab \begin{table}[htp]<cr>\begin{center}<cr>\begin{tabular}{l l l l}<cr>\toprule<cr>\midrule<cr>\bottomrule<cr>\end{tabular}<cr>\caption{}<cr>\label{tab:}<cr>\end{center}<cr>\end{table}<esc><up>
    autocmd FileType tex iabbrev 1feyn \feynmandiagram [medium,baseline=(v.base),horizontal=a to b] {a[particle=\(\mu\)] --[charged boson,momentum=k] b[particle=\(\nu\)],};
    autocmd FileType tex iabbrev 1feynci \feynmandiagram [medium,baseline=(v.base),horizontal=a to c] {{a[]} --[] v --[] b[], c[] --[] v --[] d[] }; 
    autocmd FileType tex iabbrev 1turn \begin{turn}{45}<cr>\end{turn} <esc><up>
    autocmd FileType tex iabbrev 1eqn \begin{equation}\begin{split}<CR>\end{split}\end{equation} <esc><up>
    autocmd FileType tex iabbrev 1align \begin{flalign}\label{eqn:}<cr>& \text{}\notag\\<cr>\end{flalign}<esc><up>
    " autocmd FileType tex iabbrev 1align \begin{align*}<cr>\end{align*}
    autocmd FileType tex iabbrev 1cent \begin{center}<CR>\end{center} <esc><up>
    autocmd FileType tex iabbrev 1matrix \begin{pmatrix}\end{pmatrix}<esc>F\<left>
    autocmd FileType tex iabbrev 1resize \resizebox{0.9\textheight}{!}{\vbox{%start of resize box<cr>}}%end of resize box <esc><up>$ci
    autocmd FileType tex iabbrev 1scale \scalebox{0.8}{\begin{minipage}{1.20\textwidth} % start of scalebox <cr>\end{minipage}} % stop of scalebox
    autocmd FileType tex iabbrev 1cb \blue{}<Left><C-R>=Eatchar('\s')<CR>
    autocmd FileType tex iabbrev 1ck \gray{}<Left><C-R>=Eatchar('\s')<CR>
    autocmd FileType tex iabbrev 1cg \green{}<Left><C-R>=Eatchar('\s')<CR>
    autocmd FileType tex iabbrev 1cr \red{}<Left><C-R>=Eatchar('\s')<CR>
    autocmd FileType tex iabbrev 1cy \yellow{}<Left><C-R>=Eatchar('\s')<CR>
    autocmd FileType tex iabbrev 1co \orange{}<Left><C-R>=Eatchar('\s')<CR>
    " autocmd FileType tex iabbrev 1cb {\color{blue}}<esc>i
    " autocmd FileType tex iabbrev 1ck {\color{gray}}<esc>i
    " autocmd FileType tex iabbrev 1cg {\color{green}}<esc>i
    " autocmd FileType tex iabbrev 1cr {\color{red}}<esc>i
    " autocmd FileType tex iabbrev 1cy {\color{yellow}}<esc>i
    " autocmd FileType tex iabbrev 1co {\color{orange}}<esc>i
    autocmd FileType tex iabbrev 1bf \textbf{}<Left><C-R>=Eatchar('\s')<CR>
    autocmd FileType tex iabbrev 1emph \emph{}<Left><C-R>=Eatchar('\s')<CR>
    autocmd FileType tex iabbrev fb1 $fb-1$
    autocmd FileType tex iabbrev 1eta $\|\eta\|$<left>
    autocmd FileType tex iabbrev 1v \vspace{em}<left><left><left>
    " autocmd FileType tex iabbrev 1h \noindent\rule{cm}{0.4pt}<left><left><left><left><left><left><left><left><left><left>
    autocmd FileType tex iabbrev 1draw % ##################### <cr>% Macros: 1trect, 1tcirc, 1tnode, 1tarrow, 1tstar, 1tpath <cr>% Bracket options: [red, rotate=90, fill=green, rounded corners=2pt] <cr>% Draw an arrow between nodes: \draw [->] (A) edge (B) <cr>% Box around image: \draw[thick] (page cs:-1,-1) rectangle (page cs:1,1); <cr>\begin{tikzpicture}[remember picture,overlay] <cr>%\draw[style=help lines] (0,0) grid (3,2); <cr>\end{tikzpicture}<esc>$F\i
    autocmd FileType tex iabbrev 1trect \draw[white,fill=white] (page cs: 0,0 )rectangle(4cm,3.7cm);
    autocmd FileType tex iabbrev 1tcirc \draw[red,ultra thick] (page cs: 0,0 )circle(0.3cm);
    autocmd FileType tex iabbrev 1tpath \draw[->, red,ultra thick] (A) edge (B);
    autocmd FileType tex iabbrev 1tnode \node (A) at (page cs: 0,0) {words};
    autocmd FileType tex iabbrev 1tstar \tstar{1}{1.2}{20}{2}{ultra thick, draw=red,fill=yellow,shift={(page cs: 0,0)}};
    autocmd FileType tex iabbrev 1tarrow \draw[blue,arrows={-Triangle[scale=0.5]},thin,line width=3mm] (page cs: 0.5,0) -- (page cs: -0.5,0);
    autocmd FileType tex iabbrev 1box \cfbox{red}{}<left>
    autocmd FileType tex iabbrev 1text \begin{textblock*}{1cm}(page cs: 0,0)<cr>\end{textblock*}
    autocmd FileType tex iabbrev 1s $\sigma$
    autocmd FileType tex iabbrev 1h $H\to\mu\mu$
    autocmd FileType tex iabbrev 1met $E_T^\text{miss}$
    autocmd FileType tex iabbrev 1fb fb$^{-1}$
    autocmd FileType tex iabbrev 1line \noindent\rule{\textwidth}{0.4pt}
    autocmd FileType tex iabbrev 1code \begin{lstlisting}[basicstyle=\tiny]<cr>\end{lstlisting}% place [fragile] at start of frame, use \pythonstyle for basic style
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
nnoremap gw :<c-u>let @t=getreg('"')<cr>viw"dd"tP:<c-u>let @"=getreg('t')<cr>

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

" " ###############################
" " tab/indent behavior
set ts=4 sts=4 sw=4 et
" " " fix indentation
" " set nosmartindent
" " set cinkeys-=0#
" " set indentkeys-=0#


" filetype plugin indent on

" set indentexpr=""
" set indentkeys=""

" set nosmartindent
" set smartindent
" set cindent 
inoremap # X#
" ###############################

set laststatus=2

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
" exec "set listchars=tab:\\|_,trail:\uB7,space:\uB7,nbsp:~"
" uses no unicode
exec "set listchars=tab:\\|_,nbsp:_,trail:_"
set list


" Set colorscheme AFTER reading the file, so that it gets the filetype
augroup COLOR
    autocmd BufRead,BufNewFile * colo darkRotationCurve
augroup END


" " copy to different buffer
" nnoremap c "cc
" vnoremap c "cc
" nnoremap C "cC
" vnoremap C "cC
" nnoremap d "dd
" vnoremap d "dd  
" nnoremap D "dD
" vnoremap D "dD
" nnoremap x "xx
" vnoremap x "xx
" nnoremap X "xX
" vnoremap X "xX

" " Insert itemize on new line
" function CR()
"     if searchpair('\\begin{itemize}', '', '\\end{itemize}', '')
"         return "\r\\item"
"     endif
"     return "\r"
" endfunction
" inoremap <expr><buffer> <CR> CR()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" This fixes the pink cursor from spell check: https://github.com/vim/vim/issues/3471
set t_Cs=

" if &term =~ "xterm\\|rxvt"
"   " use an orange cursor in insert mode
"   let &t_SI = "\<Esc>]12;orange\x7"
"   " use a red cursor otherwise
"   let &t_EI = "\<Esc>]12;red\x7"
"   silent !echo -ne "\033]12;red\007"
"   " reset cursor when vim exits
"   autocmd VimLeave * silent !echo -ne "\033]112\007"
"   " use \003]12;gray\007 for gnome-terminal
" endif

function! RunDebugLog()
    let script_path = '/home/prime/dev/notes/debug/log.py'
    let command = 'execute "!python3 ' . script_path . '%' . '"'
    silent call system(command)
endfunction

" nnoremap gg :call RunDebugLog()<CR>

