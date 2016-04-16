find_up() {
    if test $# -ne 2
    then
        return 0
    fi
    SUB="$1"
    DIR="$2"
    if test -e "$DIR/$SUB"
    then
        echo "$DIR/$SUB"
    fi
    PARENT_DIR="$(dirname "$DIR")"
    if test "$DIR" != "$PARENT_DIR"
    then
        find_up "$SUB" "$PARENT_DIR"
    fi
}

git_ps1() {
    local BRANCH=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if test -n "${BRANCH}"
    then
        export PS1="${PS1} (git:${BRANCH})"
    fi
}

hg_ps1() {
    export PS1="${PS1} (hg)"
}

svn_ps1() {
    export PS1="${PS1} (svn)"
}

build_ps1 () {
    PS1='\h:\w'
    if test -n "$SUDO_USER"
    then
        PS1="\u@$PS1"
    fi

    if git rev-parse --is-inside-work-tree 1> /dev/null 2> /dev/null; then git_ps1; fi

    local -a TAGS
    if test ${#TAGS[@]} -gt 0
    then
        PS1="${PS1} (${TAGS[@]})"
    fi
    PS1="${PS1}\n\`if [ \$? == 0 ]; then echo $; else echo !; fi\` "
}

export PROMPT_COMMAND="build_ps1; "
export PS1
