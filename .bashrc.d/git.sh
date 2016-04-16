alias gd='git diff'
alias gf='git fetch'
alias gff='git pull --ff --ff-only'
alias gm='git merge'
alias gp='git push'
alias gs='git status -s'
alias gr='git pull --rebase'
alias gt='git-todo'
alias gw='git diff --color-words'

export LESS='-eriMXR'
GIT_PS1_SHOWDIRTYSTATE=1

function _git_base_dir {
    git rev-parse --show-toplevel
}

function git-dir {
    local GIT_DIR=$(git rev-parse --show-toplevel)
    if test -d "$GIT_DIR"
    then
        cd "$GIT_DIR"
    fi
}

function git-todo {
    local GIT_DIR=$(git rev-parse --show-toplevel)
    if test -d "$GIT_DIR"
    then
        local TODO="$GIT_DIR/TODO.taskpaper"
        if test "$1" == "cat"
        then
            cat "$TODO"
        else
            vim -p "$TODO" $*
            if [ ! -s "$TODO" ]; then
                rm -f "$TODO"
            fi
        fi
    fi
}

function git-submodule-clear {
    SUBMODULE="$1"
    find "$1" -mindepth 1 -delete
}

# http://bytebaker.com/2012/01/09/show-git-information-in-your-prompt/

function git-branch-name {
    echo $(git rev-parse --abbrev-ref HEAD 2> dev/null)
}

function git-dirty {
    st=$(git status 2>/dev/null | tail -n 1)
    if [[ $st != "nothing to commit (working directory clean)" ]]
    then
        echo "*"
    fi
}

function gitify {
    status=$(git status 2>/dev/null | tail -n 1)
    if [[ $status == "" ]]
    then
        echo ""
    else
        echo $(git-branch-name)$(git-dirty)$(git-unpushed)
    fi
}

function make-prompt
{
    local RED="\[33[0;31m\]"
    local GREEN="\[33[0;32m\]"
    local LIGHT_GRAY="\[33[0;37m\]"
    local CYAN="\[33[36m\]"

    PS1="${CYAN}\h\
${GREEN} \w\
${RED} \$(gitify)\
${GREEN} >\
${LIGHT_GRAY} "
}
