if test -d "$HOME/.linuxbrew/bin"
then
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export MANPATH="$(brew --prefix)/share/man:$MANPATH"
    export INFOPATH="$(brew --prefix)/share/info:$INFOPATH"
fi
