PYENV_ROOT="$HOME/src/github.com/pyenv/pyenv"
if test -d "$PYENV_ROOT"
then
    export PYENV_ROOT
    export PATH="$PYENV_ROOT/bin${PATH:+:}$PATH"
    eval "$(pyenv init -)"
    if test -d "$PYENV_ROOT"/plugins/virtualenv/
    then
        eval "$(pyenv virtualenv-init -)"
    fi
else
    unset PYENV_ROOT
fi
