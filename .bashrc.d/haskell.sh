if test -d "$HOME/.cabal/bin"
then
    export PATH="$PATH:$HOME/.cabal/bin"
fi

if type -p stack > /dev/null
then
    eval "$(stack --bash-completion-script stack)"
fi
