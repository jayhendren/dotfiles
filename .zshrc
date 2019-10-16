# start with grml config
source ~/.zsh/grml/zshrc

autoload -Uz promptinit compinit 

# for some reason something is breaking here

promptinit 

# and here too

compinit -C

# yes, I want to show duplicates in my history
unsetopt histignorealldups

# also, get me a nice history alias
alias h="history -i -D 0"

# case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
 
# vi keybindings! :D
set -o vi
bindkey "^?" backward-delete-char
bindkey "^H" backward-delete-char

# set titlebar
precmd () { print -Pn "\e]0;%n@%m: %~\a" }

# Prompt stuff

autoload  -U colors && colors

# get name of server if we are on a client machine
server=$(mount 2> /dev/null | sed -nre "s|([^:]*):.*/usr/local.*|\1|p" 2> /dev/null | head -n 1)
if [[ -n "$server" ]]; then
  server="${server} "
fi

# get git status if we are in a git directory
source ~/.zsh/git-prompt/zshrc.sh

# prompt
prompt_1="%{%(?.$fg[white].$fg[red])%}[%{$fg[cyan]%}${server}%{$fg[blue]%}%m %{$fg[green]%}%~%{%(?.$fg[white].$fg[red])%}]%{$reset_color%}"
prompt_2="%{$fg[blue]%}%#%{$reset_color%} "

# set the prompt to show what mode we're in
if is5; then
    setopt PROMPT_SUBST
    vim_ins_mode="%{$fg[cyan]%}[%{$fg[blue]%}I%{$fg[cyan]%}]%{$reset_color%}"
    vim_cmd_mode="%{$fg[yellow]%}[%{$fg[green]%}N%{$fg[yellow]%}]%{$reset_color%}"
    vim_mode=$vim_ins_mode
    
    function zle-keymap-select {
      vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
      zle reset-prompt
    }
    zle -N zle-keymap-select
    
    function zle-line-finish {
      vim_mode=$vim_ins_mode
    }
    zle -N zle-line-finish
    
    function TRAPINT() {
      vim_mode=$vim_ins_mode
      return $(( 128 + $1 ))
    }
    
    PS1=${prompt_1}'$(git_super_status)${vim_mode}'${prompt_2}
else
    PS1=${prompt_1}${prompt_2}
fi

# Fix problem where auto completion with scp hangs
if [ -f ~/.ssh/known_hosts ]; then
    hosts=(`awk '{print $1}' ~/.ssh/known_hosts | tr ',' '\n'`)
    zstyle ':completion:*:hosts' hosts $hosts
fi

# source local .zshrc settings
if [ -f ~/.zshrc-local ]; then source ~/.zshrc-local; fi

# curl -L http://bit.ly/10hA8iC | bash
