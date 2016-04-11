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

alias dv01='ssh -t dc2gochugedv01.it.savvis.net sudo -i'
alias qa01='ssh -t dc2gochugeqa01.it.savvis.net sudo -i'
alias pd01='ssh -t dc2gochugepd01.it.savvis.net sudo -i'
alias pd02='ssh -t dc2gochugepd02.it.savvis.net sudo -i'
alias pd03='ssh -t dc2gochugepd03.it.savvis.net sudo -i'
alias dr01='ssh -t uk6gochugepd01.it.savvis.net sudo -i'
alias dr02='ssh -t uk6gochugepd02.it.savvis.net sudo -i'
