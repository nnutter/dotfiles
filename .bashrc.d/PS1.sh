find_up() {
    if [ $# -ne 2 ]; then
        return 0
    fi
    SUB="$1"
    DIR="$2"
    if [ -e "$DIR/$SUB" ]; then
        echo "$DIR/$SUB"
    fi
    PARENT_DIR="$(dirname "$DIR")"
    if [ "$DIR" != "$PARENT_DIR" ]; then
        find_up "$SUB" "$PARENT_DIR"
    fi
}

in_hg() {
    find_up .hg "$(pwd)"
}

in_svn() {
    find_up .svn "$(pwd)"
}

git_ps1() {
    local BRANCH=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if [ -n "${BRANCH}" ]; then
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
    if [ -n "$SUDO_USER" ]; then
        PS1="\u@$PS1"
    fi

    if git rev-parse --is-inside-work-tree 1> /dev/null 2> /dev/null; then git_ps1; fi
#    [ "$(in_hg)" ] && hg_ps1
#    [ "$(in_svn)" ] && svn_ps1

    local -a TAGS
    if [ ${#TAGS[@]} -gt 0 ]; then
        PS1="${PS1} (${TAGS[@]})"
    fi
    PS1="${PS1}\n\`if [ \$? == 0 ]; then echo $; else echo !; fi\` "
}

export PROMPT_COMMAND="LAST_EXIT_CODE=\$?; build_ps1; "
export PS1
