if test -d "$HOME/.rbenv/bin"
then
    export PATH="$HOME/.rbenv/bin${PATH:+:}$PATH"
    eval "$(rbenv init -)"
fi
