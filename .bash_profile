function use {
    if test -d "$1"
    then
        local SH_FILE
        for SH_FILE in $(find -L "$1" -name '*.sh')
        do
            source "$SH_FILE"
        done
        return
    fi

    if test -r "$1" -a -f "$1"
    then
        source "$1"
        return
    fi
}

if hash brew 2> /dev/null
then
    for script in $(brew --prefix)/etc/profile.d/*.sh; do
        if test -r $script
        then
            source $script
        fi
    done
fi

if hash keychain 2> /dev/null
then
    eval $(keychain --eval --quick --quiet --agents gpg,ssh)
fi

use "$HOME/.bashrc"
use "/usr/local/etc/profile.d"
