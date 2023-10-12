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

white='\[\e[0;37m\]'
blue='\[\e[0;34m\]'
green='\[\e[0;32m\]'
reset='\[\e[0m\]'
PS1="${white}[${blue}\h ${green}\w${white}]${blue}\$${reset} "
