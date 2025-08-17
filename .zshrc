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
#
#setopt GLOB_COMPLETE
#setopt NO_CASE_GLOB
#
#setopt APPEND_HISTORY
#setopt HIST_EXPIRE_DUPS_FIRST
#setopt HIST_FIND_NO_DUPS
#setopt HIST_IGNORE_DUPS
#setopt HIST_REDUCE_BLANKS
#setopt HIST_VERIFY
#
#setopt interactivecomments
#
#if type brew &>/dev/null; then
#    export CLOUDSDK_PYTHON=/opt/homebrew/bin/python3
#fi
#fpath=(/Users/nnutter/.docker/completions $fpath)
#
#if type brew &>/dev/null; then
#    source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
#    export PATH="$PATH":"$(brew --prefix)/sbin"
#fi
## source ~/.bash_completion.d/*.sh
#zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
#
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
#complete -o nospace -C /usr/local/bin/terraform terraform
#
#export PATH="$HOME/src/github.com/pyenv/pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#
#
#bindkey -e

if ls --version 2>/dev/null | grep -qi gnu
then
    alias ls='\ls --color=auto'
else
    alias ls='\ls -G'
fi
alias ll='ls -l'

export EDITOR=nvim
export SUDO_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

export GOPATH="$HOME/.go:$HOME"
export GOPRIVATE="code.cbbapps.com"
export HISTSIZE=1000000000
export PIPENV_IGNORE_VIRTUALENVS=1
export SAVEHIST=$HISTSIZE
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

safe_path_prepend() {
    # Skip if not a directory
    if ! test -d "$1"
    then
      return
    fi

    # Skip if already in PATH
    if echo $PATH | tr ':' '\n' | grep -q '^'"$1"'$'
    then
      return
    fi

    export PATH="${1}:${PATH}"
}
safe_path_prepend /opt/homebrew/bin
safe_path_prepend $HOME/bin
safe_path_prepend $HOME/.go/bin
safe_path_prepend $HOME/.local/bin

setopt AUTO_CD
setopt EXTENDED_HISTORY

if type brew &>/dev/null; then
    fpath+=$(brew --prefix)/share/zsh-completions
fi
fpath+=$HOME/.local/share/zsh/completions
fpath+=$HOME/.local/share/zsh/site-functions
autoload -Uz compinit
compinit
compdef roam=git

# Source all functions from site-functions
for func in $HOME/.local/share/zsh/site-functions/*; do
    if [[ -r "$func" ]]; then
        autoload -Uz "${func:t}"
    fi
done

safe_source() {
    if test -f "$1"
    then
        source "$1"
    fi
}
safe_source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
safe_source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
safe_source /opt/homebrew/Caskroom/gcloud-cli/latest/google-cloud-sdk/completion.zsh.inc
safe_source $HOME/.local/share/omarchy/default/bash/aliases
safe_source $HOME/.local/share/omarchy/default/bash/functions

if type starship &>/dev/null; then eval "$(starship init zsh)"; fi
if type fzf &>/dev/null; then eval "$(fzf --zsh)"; fi
if type mise &>/dev/null; then eval "$(mise init zsh)"; fi
if type zoxide &>/dev/null; then eval "$(zoxide init zsh)"; fi
