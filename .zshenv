# tmuxを起動するとplenvなどが後ろに持って行かれてしまうから注意
# see https://github.com/sstephenson/rbenv/issues/369#issuecomment-22200587
PATH="/usr/local/bin:$HOME/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which plenv > /dev/null; then eval "$(plenv init -)"; fi
