test -d '/usr/local/opt/go/libexec/bin' && export PATH="$PATH:/usr/local/opt/go/libexec/bin"
test -d '/usr/local/go/bin' && export PATH="$PATH:/usr/local/go/bin"

test -d "${HOME}/.cache/go" && export GOPATH="${HOME}/.cache/go" && export PATH="$PATH:${HOME}/.cache/go/bin"
