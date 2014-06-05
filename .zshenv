export GOPATH="$HOME/.go"

# tmuxを起動するとplenvなどが後ろに持って行かれてしまうから注意
# see https://github.com/sstephenson/rbenv/issues/369#issuecomment-22200587
export PATH="/usr/local/bin:$HOME/bin:$HOME/.go/bin:$PATH"

# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/shims:${PATH}"
source "/usr/local/Cellar/rbenv/0.4.0/completions/rbenv.zsh"
# rbenv rehash 2>/dev/null
rbenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval `rbenv "sh-$command" "$@"`;;
  *)
    command rbenv "$command" "$@";;
  esac
}


# if which plenv > /dev/null; then eval "$(plenv init -)"; fi
PATH="$HOME/.plenv/shims:$PATH"
source "/usr/local/Cellar/plenv/2.1.1/completions/plenv.zsh"
plenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "`plenv "sh-$command" "$@"`";;
  *)
    command plenv "$command" "$@";;
  esac
}
