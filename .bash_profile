function use {
    if [ -d "$1" ]; then
        local SH_FILE
        for SH_FILE in $(find -L "$1" -name '*.sh'); do
            source "$SH_FILE"
        done
    else
        [[ -r "$1" ]] && source "$1"
    fi
}

use /gapp/noarch/share/login/gapp.profile

export PERLBREW_ROOT=$HOME/.perlbrew
use "$PERLBREW_ROOT/etc/bashrc"

use "$HOME/.rvm/scripts/rvm"

if hash keychain; then
    eval $(keychain --eval --quick --quiet)
fi

use "$HOME/.bashrc"
