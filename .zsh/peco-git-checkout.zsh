function peco-git-checkout () {
    local selected_branch=$(git branch | sed 's/^\*//' | sed 's/\ //g' | peco --query "$LBUFFER")
    BUFFER="git checkout ${selected_branch}"
    zle accept-line
    zle clear-screen
}
zle -N peco-git-checkout
bindkey '^b' peco-git-checkout
