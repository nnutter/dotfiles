BREW_PREFIX=$(brew --prefix 2> /dev/null)
if [ -n "$BREW_PREFIX" ]; then
    source_if_file "$BREW_PREFIX/etc/bash_completion"
fi
