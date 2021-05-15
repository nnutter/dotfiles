GO_BIN_DIRS=('/usr/local/opt/go/libexec/bin' '/usr/local/go/bin')
for DIR in "${GO_BIN_DIRS[@]}"
do
    if test -d "$DIR"
    then
        export PATH="${PATH}${PATH:+:}${DIR}"
    fi
done

export GO111MODULE="auto"
export GOPATH="${HOME}/.go:${HOME}"
export GOPRIVATE="github.platforms.engineering"
export PATH="${HOME}/.go/bin${PATH:+:}${PATH}"
export CGO_LDFLAGS="-g -O2 -L/usr/local/opt/openssl/lib"
export CGO_CFLAGS="-g -O2 -I/usr/local/opt/openssl/include"

GO_TOOLS=(
    golang.org/x/mod/module
    golang.org/x/tools/gopls

    github.com/acroca/go-symbols
    github.com/alecthomas/gometalinter
    github.com/cweill/gotests/...
    github.com/davidrjenni/reftools/cmd/fillstruct
    github.com/fatih/gomodifytags
    github.com/fatih/motion
    github.com/go-delve/delve/cmd/dlv
    github.com/golang/tools/gopls
    github.com/josharian/impl
    github.com/jstemmer/gotags
    github.com/kisielk/errcheck
    github.com/klauspost/asmfmt/cmd/asmfmt
    github.com/koron/iferr
    github.com/mdempsky/gocode
    github.com/ramya-rao-a/go-outline
    github.com/rogpeppe/godef
    github.com/stamblerre/gocode
    github.com/uudashr/gopkgs/cmd/gopkgs
    github.com/zmb3/gogetdoc
    golang.org/x/lint/golint
    golang.org/x/tools/cmd/goimports
    golang.org/x/tools/cmd/gorename
    golang.org/x/tools/cmd/guru
    honnef.co/go/tools/cmd/keyify
    honnef.co/go/tools/cmd/staticcheck
)

install-go-tools() {
    (
        cd ~
        for TOOL in "${GO_TOOLS[@]}"
        do
            echo 1>&2 "Installing $TOOL..."
            go get -u "$TOOL"
        done
    )
}

recompile-go-tools() {
    (
        cd ~
        for TOOL in "${GO_TOOLS[@]}"
        do
            echo 1>&2 "Recompiling $TOOL..."
            go install -a "$TOOL"
        done
    )
}
