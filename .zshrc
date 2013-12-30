ZSH=$HOME/.oh-my-zsh

# ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

plugins=(git autojump git)
source $ZSH/oh-my-zsh.sh

alias tmux="tmux -f ~/.tmux.conf"
alias gs="git status"
alias vi="~/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"