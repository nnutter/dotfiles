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

SSH_SH="$HOME/.bashrc.d/ssh.sh"
SSH_CACHE="${SSH_SH}.cache"
SSH_LOCAL="${SSH_SH}.local"

function ssh-function-regen {
    bhosts -w | tail -n +2 | sed -e 's/\.gsc\.wustl\.edu.*//' > "$SSH_CACHE"
    source "$SSH_SH"
}

for FILE in "$SSH_CACHE" "$SSH_LOCAL"
do
    if [ -f "$FILE" ]
    then
        for HOST in $(cat "$FILE")
        do
            eval "function $HOST { ssh $HOST.gsc.wustl.edu \"\$@\"; }"
        done
    fi
done
