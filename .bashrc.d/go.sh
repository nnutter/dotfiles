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

recompile-go-tools() {
    TOOLS=(
        github.com/acroca/go-symbols
        github.com/alecthomas/gometalinter
        github.com/cweill/gotests/...
        github.com/davidrjenni/reftools/cmd/fillstruct
        github.com/fatih/gomodifytags
        github.com/josharian/impl
        github.com/kisielk/errcheck
        github.com/ramya-rao-a/go-outline
        github.com/rogpeppe/godef
        github.com/uudashr/gopkgs/cmd/gopkgs
        github.com/zmb3/gogetdoc
        golang.org/x/lint/golint
        golang.org/x/tools/cmd/goimports
        golang.org/x/tools/cmd/gorename
        golang.org/x/tools/cmd/guru
        honnef.co/go/tools/cmd/keyify
        honnef.co/go/tools/cmd/staticcheck
    )
    for TOOL in "${TOOLS[@]}"
    do
        echo 1>&2 "Recompiling $TOOL..."
        go install -a "$TOOL"
    done
}
