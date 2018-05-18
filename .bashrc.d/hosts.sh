HOSTFILE=$HOME/.hosts
complete -A hostname -o default curl dig host netcat ping telnet

complete -r ssh mosh 1>/dev/null 2>/dev/null || true
complete -A hostname -o default ssh mosh
