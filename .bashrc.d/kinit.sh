#!/bin/bash

_UID="$(id -u)"
export KRB5CCNAME="/tmp/krb5cc_${_UID}"

kinit() {
    if __no_krb5_ticket_cache || __expired_krb5_tgt
    then
        __krb5_login
    fi

    if __missing_mgi_tgt
    then
        echo 1>&2 'ERROR: You are not logged into the GSC.WUSTL.EDU realm.'
        return 1
    fi
}

__no_krb5_ticket_cache() {
    ! klist -c "$KRB5CCNAME" 1>/dev/null 2>/dev/null
}

__expired_krb5_tgt() {
    ! klist -s
}

__missing_mgi_tgt() {
    ! klist -c "$KRB5CCNAME" 2>/dev/null | grep -q 'krbtgt/GSC.WUSTL.EDU@GSC.WUSTL.EDU'
}

__krb5_login() {
    command kinit -c "$KRB5CCNAME"
}
