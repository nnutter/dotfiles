P_SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
if test -e "$P_SSH_AUTH_SOCK"; then
    export SSH_AUTH_SOCK="$P_SSH_AUTH_SOCK"
fi

if test -z "$SSH_AUTH_SOCK"; then
    eval "$(ssh-agent -s)" 1>/dev/null
fi

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
