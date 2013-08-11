[[ -d "$HOME/.perlbrew" ]] && export PERLBREW_ROOT="$HOME/.perlbrew"
[[ -s "$PERLBREW_ROOT/etc/bashrc" ]] && source "$PERLBREW_ROOT/etc/bashrc"
alias cpanm='cpanm --prompt'
