if [ "${BASH_VERSINFO[0]}" -ge "4" ]; then
    shopt -s autocd
    shopt -s checkjobs
fi
if [ "${BASH_VERSINFO[0]}" -ge "3" ]; then
    shopt -s cmdhist
    shopt -s histappend
    shopt -s histverify
fi
