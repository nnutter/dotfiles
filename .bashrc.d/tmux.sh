if test -n "$BASH_VERSION"
then
    _tmuxs_complete() {
        COMPREPLY=()
        local SESSIONS=$(tmux list-sessions | cut -f 1 -d :)
        if test ${#COMP_WORDS[@]} -eq 2
        then
            local cur=${COMP_WORDS[COMP_CWORD]}
            COMPREPLY=($(compgen -W "$SESSIONS" -- $cur))
        fi
    }
    complete -F _tmuxs_complete tmuxs
fi

function tmuxs {
    session_name=$1
    if test -z "$session_name"
    then
        session_name='default'
    fi
    if tmux has-session -t "$session_name"; then
        command tmux attach -t $session_name
    else
        command tmux new -s $session_name -n ''
    fi
}
