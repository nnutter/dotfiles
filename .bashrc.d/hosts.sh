HOSTFILE=$HOME/.hosts
complete -A hostname -o default curl dig host netcat ping telnet

complete -r ssh 1>/dev/null || true
complete -r mosh 1>/dev/null || true
complete -A hostname -o default ssh mosh
