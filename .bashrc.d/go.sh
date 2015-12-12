test -d '/usr/local/opt/go/libexec/bin' && export PATH="$PATH:/usr/local/opt/go/libexec/bin"
test -d '/usr/local/go/bin' && export PATH="$PATH:/usr/local/go/bin"

test -d "${HOME}/.go" && export GOPATH="${HOME}/.go" && export PATH="$PATH:${HOME}/.go/bin"
