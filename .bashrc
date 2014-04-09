#
# ~/.bashrc
#

# source environment settings
if [ -f ~/.shenv ]; then source ~/.shenv; fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
