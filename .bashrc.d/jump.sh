export MARKPATH=$HOME/.marks
if [ ! -d $MARKPATH ]; then
    mkdir $MARKPATH
fi

function jump {
    if [ -z "$1" ]; then
        echo "ERROR: No mark specified."
        return
    fi
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark {
    if [ -z "$1" ]; then
        echo "ERROR: No name specified."
        return
    fi
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark {
    if [ -z "$1" ]; then
        echo "ERROR: No mark specified."
        return
    fi
    rm -i $MARKPATH/$1
}
function marks {
    for MARK in $(\ls $MARKPATH); do
        local TARGET="$(readlink "$MARKPATH/$MARK")"
        echo "$MARK,->,$TARGET"
    done | column -s ',' -t
}

function _jump_complete {
    local CUR=${COMP_WORDS[COMP_CWORD]}
    if [ "$COMP_CWORD" -eq 1 ]; then
        local MARKS=$(\ls $MARKPATH)
        COMPREPLY=( $(compgen -W "$MARKS" -- $CUR) )
    fi
}
complete -F _jump_complete jump
