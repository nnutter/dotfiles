[ -d "$HOME/.cabal/bin" ] && export PATH="$PATH:$HOME/.cabal/bin"

if type -p stack > /dev/null; then
    eval "$(stack --bash-completion-script stack)"
fi
