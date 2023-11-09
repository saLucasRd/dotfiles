#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#ALIAS
alias p='sudo pacman'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='eza --long --icons -a' 
#alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
