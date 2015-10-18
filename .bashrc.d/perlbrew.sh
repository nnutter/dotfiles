[[ -d "/usr/local/share/perlbrew/bin" ]] && export PERLBREW_ROOT="/usr/local/share/perlbrew"
[[ -d "$HOME/.perlbrew/bin" ]] && export PERLBREW_ROOT="$HOME/.perlbrew"

[[ -s "$PERLBREW_ROOT/etc/perlbrew-completion.bash" ]] && source "$PERLBREW_ROOT/etc/perlbrew-completion.bash"
[[ -s "$PERLBREW_ROOT/etc/bashrc" ]] && source "$PERLBREW_ROOT/etc/bashrc"
[[ -d "$PERLBREW_ROOT/bin" ]] && export PATH="$PATH:$PERLBREW_ROOT/bin"
alias cpanm='cpanm --prompt'
