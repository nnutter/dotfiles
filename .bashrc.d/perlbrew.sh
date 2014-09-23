[[ -d "/usr/local/share/perlbrew" ]] && export PERLBREW_ROOT="/usr/local/share/perlbrew"
[[ -d "$HOME/.perlbrew" ]] && export PERLBREW_ROOT="$HOME/.perlbrew"

[[ -s "$PERLBREW_ROOT/etc/perlbrew-completion.bash" ]] && source "$PERLBREW_ROOT/etc/perlbrew-completion.bash"
[[ -s "$PERLBREW_ROOT/etc/bashrc" ]] && source "$PERLBREW_ROOT/etc/bashrc"
alias cpanm='cpanm --prompt'
