echo "ENTER .bash_profile" 1>&2
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

echo "ENTER gapp.profile" 1>&2
use /gapp/noarch/share/login/gapp.profile
echo "EXIT gapp.profile" 1>&2

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

if type -p keychain > /dev/null; then
    eval $(keychain --eval --quick --quiet)
fi

use "$HOME/.bashrc"
echo "EXIT .bash_profile" 1>&2
