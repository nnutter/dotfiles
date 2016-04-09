PYENV_ROOT="$HOME/src/github.com/yyuu/pyenv"
if test -d "$PYENV_ROOT"
then
    export PYENV_ROOT
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
else
    unset PYENV_ROOT
fi
