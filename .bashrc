#
# ~/.bashrc
#

# source environment settings
if [ -f ~/.shenv ]; then source ~/.shenv; fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

which zsh >/dev/null 2>&1 && exec zsh

# vi keybindings
set -o vi

HISTTIMEFORMAT="%F %T %Z "
HISTFILE="${HOME}/.bash_histories/$(hostname -f)"

[ ! -f "$HISTFILE" ] && touch "$HISTFILE"

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='\e[0;37m[\e[0;34m\h \e[0;32m\w\e[0;37m]\e[0;34m\$\e[0m '
