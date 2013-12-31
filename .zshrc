ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git autojump)
source $ZSH/oh-my-zsh.sh

# alias
alias tmux="tmux -f ~/.tmux.conf"
alias gs="git status"
alias vi='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
