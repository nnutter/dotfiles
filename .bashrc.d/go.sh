GOCELLAR='/usr/local/Cellar/go/1.2/libexec/bin'
test -d "$GOCELLAR" && export PATH=$PATH:$GOCELLAR

GOPATH="${HOME}/.go"
test -d "$GOPATH" && export GOPATH
