GOCELLAR='/usr/local/opt/go/libexec/bin'
test -d "$GOCELLAR" && export PATH=$PATH:$GOCELLAR

GOPATH="${HOME}/.go"
test -d "$GOPATH" && export GOPATH && export PATH=$PATH:$GOPATH/bin
