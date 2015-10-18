test -d '/usr/local/opt/go/libexec/bin' && export PATH="$PATH:/usr/local/opt/go/libexec/bin"
test -d '/usr/local/go/bin' && export PATH="$PATH:/usr/local/go/bin"

GOPATH="${HOME}/.go"
test -d "$GOPATH" && export GOPATH && export PATH=$PATH:$GOPATH/bin
