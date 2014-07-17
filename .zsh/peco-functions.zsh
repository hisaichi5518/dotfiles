function peco-function-list () {
    local selected=$(functions | grep "^.*\ ()\ {" | sed -e "s| () {||" | grep peco- | grep -v function-list | peco --query "$LBUFFER")
    if [ -n "$selected" ]; then
        ${selected}
    fi
}
zle -N peco-function-list
bindkey '^p' peco-function-list

function peco-ghq () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-ghq
bindkey '^s' peco-ghq

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

function peco-select-history() {
    # oh-my-zshがhistoryを上書きしている
    BUFFER=$(\history -n 0 | tail -r | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function peco-bundle-open() {
    local selected=$(bundle show 2> /dev/null | sed -e '/^  \*/!d; s/^  \* \([^ ]*\) .*/\1/' | peco --query "$LBUFFER")
    if [ -n "$selected" ]; then
        BUFFER="bo ${selected}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-bundle-open
bindkey '^o' peco-bundle-open
