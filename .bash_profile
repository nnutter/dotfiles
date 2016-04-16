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

if hash brew 2> /dev/null
then
    for script in $(brew --prefix)/etc/profile.d/*.sh; do
        if [ -r $script ]; then
            source $script
        fi
    done
fi

if hash keychain 2> /dev/null
then
    eval $(keychain --eval --quick --quiet)
fi

use "$HOME/.bashrc"
use "/usr/local/etc/profile.d"
