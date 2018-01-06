#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# enable vim like movement
#set -o vi

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export XENVIRONMENT="~/.Xresources"
export STARDICT_DATA_DIR="~/.stardict"

alias cal="cal 2017"
alias cal8="/usr/bin/cal 2018"
alias vifm="vifmLaunch"
alias pdflatexd="pdflatex -draftmode"
#alias hg="history -a && hg.py"
alias hg="source ~/scripts/hgh"
alias ls="ls --color=auto"
alias hello="echo hello!"
alias la="ls -lrt --color=auto"
alias rm="rm -rf"
alias cp="cp -r"
alias py="python2"
alias py2="python2"
alias py3="python3"
alias p="ping www.google.com"
alias bell="echo $'\a'"
alias targz="tar -zxvf"
alias cpf=". copyAndFollow"
alias mvf=". moveAndFollow"
alias date='date "+DATE: %m/%d/%y%nTIME: %H:%M:%S"'
alias def="sdcv"
alias grep="grep -i --color=always"
alias sb="source ~/.bashrc"

#auto completion
complete -f -X '!*.pdf' evince
complete -f -X '!*.tex' pdflatex
complete -f -X '!*.tex' slidesLatex
complete -f -X '!*.py' py

# ssh shortcuts
alias t3="ssh -X -Y -i ~/.ssh/t3pers19 aaronsw@t3pers19.physics.lsa.umich.edu"
alias lxplus="ssh -Y aawhite@lxplus.cern.ch"
alias umt1="ssh -X -Y -i ~/.ssh/umt aaronsw@umt3int01.physics.lsa.umich.edu"
alias umt2="ssh -X -Y -i ~/.ssh/umt aaronsw@umt3int02.physics.lsa.umich.edu"
alias umt3="ssh -X -Y -i ~/.ssh/umt aaronsw@umt3int03.physics.lsa.umich.edu"
alias umt4="ssh -X -Y -i ~/.ssh/umt aaronsw@umt3int04.physics.lsa.umich.edu"
alias hg8i="echo gpjuik+@; ssh -p 21098 phuwus@server38.web-hosting.com"

# modify path 
PATH="/home/prime/scripts:${PATH}"
PATH="/home/prime/scripts/functionButtons:${PATH}"
	
HISTSIZE=99999
HISTFILESIZE=9999
