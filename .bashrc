echo "ENTER .bashrc" 1>&2
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

# gapp.bashrc sources ~/.bash_profile (and shouldn't?) so trick it using LD_LIBRARY_PATH
OLD_LD_LIBRARY_PATH="$LD_LIBRARY_PATH"
LD_LIBRARY_PATH="FOO"
use "/gapp/noarch/share/login/gapp.bashrc"
LD_LIBRARY_PATH="$OLD_LD_LIBRARY_PATH"
unset OLD_LD_LIBRARY_PATH

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

if [ -n "$XDG_CACHE_HOME" ]; then
    BASHBASEDIR="$XDG_CACHE_HOME/bash"
    [ ! -d "$BASHBASEDIR" ] && mkdir "$BASHBASEDIR"
    HISTFILE="$BASHBASEDIR/history"
fi

if [ "$COLORTERM" == "gnome-terminal" ] && [ "$TERM" == "xterm" ]; then
    export TERM="xterm-256color"
fi

use "/etc/bashrc"
use "/etc/bash.bashrc"

colon() {
    if [ -z "$1" ]; then
        echo "$2"
    else
        if [ -z "$2" ]; then
            echo "${1}"
        else
            echo "${1}:${2}"
        fi
    fi
}

demote_gsc_paths() {
    FRONT=''
    BACK=''
    while IFS=':' read -ra PATHS; do
        for P in "${PATHS[@]}"; do
            if [ "${P:0:5}" == "/gsc/" ] || [ "${P:0:6}" == "/gapp/" ]; then
                BACK=$(colon "$BACK" "$P")
            else
                FRONT=$(colon "$FRONT" "$P")
            fi
        done
    done <<< "$PATH";
    colon "$FRONT" "$BACK"
}

export PATH=$(demote_gsc_paths)

export CLICOLOR=1
OS=$(uname -s)

# export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

use ${HOME}/.bash_completion.d
use ${HOME}/.bashrc.d

export GPG_TTY=$(tty)

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias ls='ls -G'
alias ll='ls -lh'
echo "EXIT .bashrc" 1>&2
