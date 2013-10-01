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
    if [ -n "$WF_USE_FLOW" ]; then
        TAGS+=('FLOW')
    fi
    if [ -n "$GENOME_QUERY_POSTGRES" ]; then
        TAGS+=('GQP')
    fi
    if [ -n "$GENOME_SOFTWARE_RESULT_TEST_NAME" ]; then
        TAGS+=('GST')
    fi
    if [ -n "$UR_DBI_NO_COMMIT" ]; then
        TAGS+=('NO_COMMIT')
    fi
    if [ ${#TAGS[@]} -gt 0 ]; then
        PS1="${PS1} (${TAGS[@]})"
    fi
    PS1="${PS1}\n\`if [ \$? == 0 ]; then echo $; else echo !; fi\` "
}

function print_screen_title {
    local TITLE
    if git rev-parse --git-dir 1> /dev/null 2> /dev/null ; then
        local REPO="$(git config branchdir.name)"
        if [ -z "$REPO" ]; then
            REPO="$(basename "$(git rev-parse --show-toplevel 2> /dev/null)")"
        fi
        local BRANCH="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
        TITLE="$REPO/$BRANCH"
    fi

    if [ -z "$TITLE" ]; then
        if [ -n "$SUDO_USER" ]; then
            TITLE=${PWD/#${HOME}/\~${USER}}
        else
            TITLE=${PWD/#${HOME}/\~}
        fi
    fi
    printf "$TITLE"
}

function print_window_title {
    printf "${USER}@${HOSTNAME%%.*}:${PWD/#${HOME}/~}"
}

function set_screen_title {
    printf "\033k$1\033\\"
}

function set_window_title {
    printf "\033]0;$1\007"
}

function build_title {
    if [ "$TERM" == "screen" ] || [ "$TERM" == "screen-256color" ]; then
        set_screen_title "$(print_screen_title)"
    fi
    set_window_title "$(print_window_title)"
}

export PROMPT_COMMAND="build_ps1; build_title; "
export PS1
