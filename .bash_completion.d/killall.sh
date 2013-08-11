_complete_running_processes ()
{
    local cur prev
    local LC_ALL='C'

    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}

    # do not attempt completion if we're specifying an option
    [[ "$cur" == -* ]] && return 0

    # Escape dots in paths for grep
    cur=${cur//\./\\\.}

    local IFS="
"
    COMPREPLY=( $(ps axc|awk '{ print $5 }'|sort -u|grep -v "^[\-\(]"|grep -i "^$cur") )

    return 0
}

complete -o bashdefault -o default -o nospace -F _complete_running_processes killall 2>/dev/null || complete -o default -o nospace -F _complete_running_processes killall
