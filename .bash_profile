source "$HOME/.bash_stdlib"

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
