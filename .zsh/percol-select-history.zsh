function percol-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi

    # oh-my-zshがhistoryを上書きしている
    BUFFER=$(\history -n 0 | tail -r | percol --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N percol-select-history
bindkey '^r' percol-select-history
