if test -z "$SSH_AUTH_SOCK"; then
    eval "$(ssh-agent -s)" 1>/dev/null
fi

function ssh {
    if /usr/bin/which kinit 1>/dev/null 2>/dev/null
    then
        kinit
    fi
    command ssh "$@"
}

function ssh-reagent {
    for agent in /tmp/ssh-*/agent.*; do
        export SSH_AUTH_SOCK=$agent
        if ssh-add -l 2>&1 > /dev/null; then
            echo Found working SSH Agent:
            ssh-add -l
            return
        fi
    done
    echo Cannot find ssh agent - maybe you should reconnect and forward it?
}
