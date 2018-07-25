if type -p brew > /dev/null; then
    BREW_PREFIX=$(brew --prefix 2> /dev/null)
    if [ -n "$BREW_PREFIX" ]; then
        use "$BREW_PREFIX/etc/bash_completion"
        use "$BREW_PREFIX/etc/bash_completion.d"
    fi
fi
