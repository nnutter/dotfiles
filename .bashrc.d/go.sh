GO_BIN_DIRS=('/usr/local/opt/go/libexec/bin' '/usr/local/go/bin')
for DIR in "${GO_BIN_DIRS[@]}"
do
    if test -d "$DIR"
    then
        export PATH="${PATH}${PATH:+:}${DIR}"
    fi
done

export GOPATH="${HOME}/.go:${HOME}"
export PATH="${HOME}/.go/bin${PATH:+:}${PATH}"
