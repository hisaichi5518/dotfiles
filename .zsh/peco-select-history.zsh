function peco-select-history() {
    # oh-my-zshがhistoryを上書きしている
    BUFFER=$(\history -n 0 | tail -r | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
