if test -d "/usr/local/share/perlbrew/bin"
then
    export PERLBREW_ROOT="/usr/local/share/perlbrew"
fi
if test -d "$HOME/.perlbrew/bin"
then
    export PERLBREW_ROOT="$HOME/.perlbrew"
fi

if test -s "$PERLBREW_ROOT/etc/perlbrew-completion.bash"
then
    source "$PERLBREW_ROOT/etc/perlbrew-completion.bash"
fi
if test -s "$PERLBREW_ROOT/etc/bashrc"
then
    source "$PERLBREW_ROOT/etc/bashrc"
fi
if test -d "$PERLBREW_ROOT/bin"
then
    export PATH="$PATH:$PERLBREW_ROOT/bin"
fi
alias cpanm='cpanm --prompt'
