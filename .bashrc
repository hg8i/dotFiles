#
# ~/.bashrc
#

unalias -a

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# enable vim like movement
#set -o vi

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


export XENVIRONMENT="~/.Xresources"
export STARDICT_DATA_DIR="~/.stardict-1"
# export TERM=xterm-color

# Copy current dir. Not going to use dir command any time soon
alias dir="echo Clipping path:;path; pwd | tr \"\n\" \"/\" | rev | cut -z -d \"/\" -f2 | rev | xclip"

alias o="open"
alias oo="open; fg"
# alias beep="echo -ne '\007'"
alias gcd=". ~/scripts/gcd.sh"
alias cd="cd -P"
alias cal="~/dev/isoplan/isoplan.py"
alias vifm="vifmLaunch"
alias pdflatexd="pdflatex -draftmode"
#alias hg="history -a && hg.py"
alias hg="source ~/scripts/hgh"
# alias ls="ls --color=auto"
alias hello="echo hello!"
alias la="ls -lrta --color=auto"
alias rm="rm -rf"
alias cp="cp -r"
alias py="python2 -B"
alias py2="python2"
alias py3="python3"
alias p="ping www.google.com"
alias bell="echo $'\a'"
alias targa="tar -zxaf"
alias targz="tar -xvzf"
alias tarxz="tar -xf"
alias root="root -l"
alias b="cd ../"
alias bb="cd ../../"
# alias ll="ls -lrt"
# alias ls1="/bin/ls -1 | xclip"

alias cpf=". copyAndFollow"
alias mvf=". moveAndFollow"
# alias date='date "+DATE: %m/%d/%y%nTIME: %H:%M:%S"'
alias def="sdcv"
alias grep="grep -i --color=always" #removed because atlas software uses this as dependance :(
alias bashrc="source ~/.bashrc"
alias pic1="gnome-screenshot -a -f $(mktemp -u /tmp/gscreenshot.XXXX.png)"
# alias pic="gnome-screenshot -a -f"

#auto completion
complete -f -X '!*.pdf' evince
complete -f -X '!*.pdf' zathura
complete -f -X '!*.tex' pdflatex
complete -f -X '!*.tex' lualatex
complete -f -X '!*.tex' slidesLatex
complete -f -X '!*.ods' libreoffice
complete -f -X '!*.py' py

# ssh shortcuts
alias t3="ssh -X -Y -i ~/.ssh/t3pers19 aaronsw@t3pers19.physics.lsa.umich.edu"
alias lxplus="ssh -Y aawhite@lxplus.cern.ch"
alias umt1="ssh -X -Y -i ~/.ssh/umt aaronsw@umt3int01.physics.lsa.umich.edu"
alias umt2="ssh -X -Y -i ~/.ssh/umt aaronsw@umt3int02.physics.lsa.umich.edu"
alias umt3="ssh -X -Y -i ~/.ssh/umt aaronsw@umt3int03.physics.lsa.umich.edu"
alias umt4="ssh -X -Y -i ~/.ssh/umt aaronsw@umt3int04.physics.lsa.umich.edu"
alias umt5="ssh -X -Y -i ~/.ssh/umt aaronsw@umt3int05.physics.lsa.umich.edu"
alias hg8i="ssh -i ~/.ssh/hg8i -p 21098 phuwus@server38.web-hosting.com"
alias sshfs_hg8i="sshfs -p 21098 phuwus@server38.web-hosting.com:/home/phuwus/public_html ~/sshfs/hg8i -o IdentityFile=~/.ssh/hg8i; cd ~/sshfs/hg8i"

# modify path 
PATH="~/scripts:${PATH}"
PATH="~/scripts/functionButtons:${PATH}"
PATH="~/scripts/xStateToggle:${PATH}"

#unfreeze ctrl-s
stty -ixon

HISTSIZE=99999
HISTFILESIZE=9999

# colorful prompt
export PS1="[\u@\h \W]\$" # original
export PS1="[\[\033[1;34m\]\u@\h \W\[\033[0m\]]$ "


#source local files (should come at end to allow over-ride)
if [ -f ~/.bashlocal ]; then
    source ~/.bashlocal
fi

alias zathura="zathura -c ~/dotFiles"

# save git credentials
alias git_store_credentials="git config credential.helper store"
# save git shor remote origin
alias git_remote_show_origin="git remote show origin"

# kill jobs in terminal matching pattern
alias killpy='kill -9 $(ps | grep python2 | cut -d " " -f2)'
