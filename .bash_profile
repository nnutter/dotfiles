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

if hash brew 2> /dev/null; then
    for script in $(brew --prefix)/etc/profile.d/*.sh; do
        if [ -r $script ]; then
            source $script
        fi
    done
fi

export PERLBREW_ROOT=$HOME/.perlbrew
use "$PERLBREW_ROOT/etc/bashrc"

use "$HOME/.rvm/scripts/rvm"

if hostname | grep -vqP '^blade[0-9-]+.gsc\.wustl\.edu' && type -p keychain > /dev/null
then
    eval $(keychain --eval --quick --quiet)
fi

use "$HOME/.bashrc"

if hash opam 2> /dev/null; then
    eval $(opam config env)
fi
