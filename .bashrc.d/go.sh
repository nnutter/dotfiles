if test -d '/usr/local/opt/go/libexec/bin'
then
    export PATH="${PATH}${PATH:+:}/usr/local/opt/go/libexec/bin"
fi
if test -d '/usr/local/go/bin'
then
    export PATH="${PATH}${PATH:+:}/usr/local/go/bin"
fi

export GOPATH="${HOME}/go:${HOME}"
export PATH="${HOME}/go/bin${PATH:+:}${PATH}"
