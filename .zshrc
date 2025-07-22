## create a zkbd compatible hash;
## to add other keys to this hash, see: man 5 terminfo
#typeset -g -A key
#
#key[Home]="${terminfo[khome]}"
#key[End]="${terminfo[kend]}"
#key[Insert]="${terminfo[kich1]}"
#key[Backspace]="${terminfo[kbs]}"
#key[Delete]="${terminfo[kdch1]}"
#key[Up]="${terminfo[kcuu1]}"
#key[Down]="${terminfo[kcud1]}"
#key[Left]="${terminfo[kcub1]}"
#key[Right]="${terminfo[kcuf1]}"
#key[PageUp]="${terminfo[kpp]}"
#key[PageDown]="${terminfo[knp]}"
#key[ShiftTab]="${terminfo[kcbt]}"
#
## setup key accordingly
#[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
#[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
#[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
#[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
#[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
#[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
#[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
#[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
#[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
#[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
#[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
#[[ -n "${key[ShiftTab]}"  ]] && bindkey -- "${key[ShiftTab]}"  reverse-menu-complete
#
#bindkey "^H" backward-kill-word
#bindkey "^[f" forward-word
#
## Finally, make sure the terminal is in application mode, when zle is
## active. Only then are the values from $terminfo valid.
#if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
#	autoload -Uz add-zle-hook-widget
#	function zle_application_mode_start {
#		echoti smkx
#	}
#	function zle_application_mode_stop {
#		echoti rmkx
#	}
#	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
#	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
#fi
#
#autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search
#
#bindkey '^R' history-incremental-search-backward
#[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
#[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
#
#autoload -Uz vcs_info
#
#precmd_vcs_info() {
#    vcs_info
#}
#
#preexec_start_time () {
#    PREEXEC_START_TIME="$(date +"%H:%M:%S") - "
#}
#
#get_title() {
#    if git rev-parse --is-inside-work-tree 1>/dev/null 2>/dev/null; then
#        git rev-parse --show-toplevel | sed 's|.*/||'
#        return
#    fi
#    print -P '%3c'
#}
#
#set_title() {
#    echo -ne "\033]0;""$(get_title)""\007"
#    echo -ne "\033]1;""$(get_title)""\007"
#}
#
#precmd_functions+=( precmd_vcs_info )
#precmd_functions+=( set_title )
#preexec_functions+=( preexec_start_time )
#setopt prompt_subst
#zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f '
#zstyle ':vcs_info:*' enable git
#
#PROMPT=$'\n'"\${vcs_info_msg_0_}%3~"$'\n''[%h] %(!.#.$) '
#RPROMPT="%{$(echotc UP 2)%} %(?..%F{red})\${PREEXEC_START_TIME}%* %(?.√.%?)%f%{$(echotc DO 2)%}"
#
#export PATH="${HOME}/bin:${HOME}/.local/bin:${HOME}/Library/Python/3.9/bin:/opt/homebrew/bin:${PATH}"
#
#setopt AUTO_CD
#
#setopt GLOB_COMPLETE
#setopt NO_CASE_GLOB
#
#setopt APPEND_HISTORY
#setopt EXTENDED_HISTORY
#setopt HIST_EXPIRE_DUPS_FIRST
#setopt HIST_FIND_NO_DUPS
#setopt HIST_IGNORE_DUPS
#setopt HIST_REDUCE_BLANKS
#setopt HIST_VERIFY
#
#setopt interactivecomments
#
#HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
#SAVEHIST=5000
#HISTSIZE=2000
#
#if type brew &>/dev/null; then
#    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
#    export CLOUDSDK_PYTHON=/opt/homebrew/bin/python3
#fi
#fpath+=~/.zfunc
#fpath=(/Users/nnutter/.docker/completions $fpath)
#
#autoload -Uz compinit
#compinit
#if type brew &>/dev/null; then
#    source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
#    export PATH="$PATH":"$(brew --prefix)/sbin"
#fi
## source ~/.bash_completion.d/*.sh
#zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
#
#alias ls='\ls -G'
#alias ll='ls -l'
#alias vim='GO111MODULE=off vim'
#
#export EDITOR=/opt/homebrew/bin/vim
#
#source $HOME/.bashrc.d/tmux.sh
#
#P_SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
#if test -e "$P_SSH_AUTH_SOCK"; then
#    export SSH_AUTH_SOCK="$P_SSH_AUTH_SOCK"
#fi
#
#cdup() {
#    cd "$(git rev-parse --show-cdup)"
#}
#
## Added start time via preexec which I think I prefer.
## REPORTTIME=10
#
#zmodload zsh/mapfile
#
## autoload -U +X bashcompinit && bashcompinit
#complete -o nospace -C /usr/local/bin/terraform terraform
#
#export USE_GKE_GCLOUD_AUTH_PLUGIN=True
#
#export PATH="$HOME/.go/bin:$HOME/bin:$HOME/src/github.com/pyenv/pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#
#export PIPENV_IGNORE_VIRTUALENVS=1
#
#bindkey -e

export GOPATH="$HOME/.go:$HOME"
export GOPRIVATE="code.cbbapps.com"
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE

safe_path_prepend() {
    if test -d "$1"
    then
        export PATH="${1}:${PATH}"
    fi
}
safe_path_prepend "${HOME}/bin"
safe_path_prepend "${HOME}/.go/bin"
safe_path_prepend "/opt/homebrew/bin"

setopt AUTO_CD
setopt EXTENDED_HISTORY

fpath=(/Users/nnutter/.local/share/zsh/completions $fpath)
autoload -Uz compinit
compinit

safe_source() {
    if test -f "$1"
    then
        source "$1"
    fi
}
safe_source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
safe_source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
safe_source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
zvm_after_init_commands+=('compinit')

eval "$(starship init zsh)"
eval "$(fzf --zsh)"
