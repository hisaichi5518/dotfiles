function peco-git-checkout () {
    local selected_dir=$(git branch | sed 's/\*//' | sed 's/\ //g' | peco --query "$LBUFFER")
    BUFFER="git checkout ${selected_dir}"
    zle accept-line
    zle clear-screen
}
zle -N peco-git-checkout
bindkey '^b' peco-git-checkout
