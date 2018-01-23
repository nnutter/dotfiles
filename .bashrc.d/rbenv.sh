RBENV_BIN="$HOME/src/github.com/rbenv/rbenv/bin"
if test -d "$RBENV_BIN"
then
    prepend_path "$RBENV_BIN"
fi

if type -p rbenv 1>/dev/null
then
    eval "$(rbenv init -)"
fi
