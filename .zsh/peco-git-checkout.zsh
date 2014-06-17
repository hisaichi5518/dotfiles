function peco-git-checkout () {
    local selected_branch=$(git branch | sed 's/[\* ]//g' | peco --query "$LBUFFER")
    if [ -n "$selected_branch" ]; then
        BUFFER="git checkout ${selected_branch}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-git-checkout
bindkey '^b' peco-git-checkout
