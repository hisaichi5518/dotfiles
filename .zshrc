# for oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
ZSH_CUSTOM="$HOME/.zsh"

plugins=(git autojump)
source $ZSH/oh-my-zsh.sh

# for history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
