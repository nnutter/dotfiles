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

####################
# Helper Functions #
####################

# _installed checks if an executable exists
_installed() {
    type "$1" &>/dev/null
}

# _safe_path_prepend prepends the directory to PATH but only if it exists and is
# not already in the PATH
_safe_path_prepend() {
    # Skip if not a directory
    if ! test -d "$1"; then
        return
    fi

    # Skip if already in PATH
    if echo $PATH | tr ':' '\n' | grep -q '^'"$1"'$'; then
        return
    fi

    export PATH="${1}:${PATH}"
}

# _safe_source silently skips non-existent files
_safe_source() {
    for file in "$@"; do
        if test -f "$file"; then
            source "$file"
            return 0
        fi
    done
}

#########################
# Environment Variables #
#########################

export EDITOR=nvim
export SUDO_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

# Installs Go tools, packages, etc. in ~/.go instead of the default, ~/go.
export GOPATH="$HOME/.go"
# Disables some public security checks on our private Go packages.
export GOPRIVATE="code.cbbapps.com"

export PIPENV_IGNORE_VIRTUALENVS=1

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

#################
# Shell History #
#################

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY     # Append to history file rather than overwrite
setopt EXTENDED_HISTORY   # Save commands duration
setopt INC_APPEND_HISTORY # Write to history file immediately
setopt SHARE_HISTORY      # Share history between sessions


#################
# Shell Options #
#################

setopt AUTO_CD
setopt VI

######################
# PATH Modifications #
######################

_safe_path_prepend /opt/homebrew/bin
_safe_path_prepend $HOME/.local/bin
_safe_path_prepend $HOME/.go/bin
_safe_path_prepend $HOME/bin

#####################
# Shell Completions #
#####################

if type brew &>/dev/null; then
    fpath+=$(brew --prefix)/share/zsh/site-functions
fi
fpath+=$HOME/.local/share/zsh/site-functions
autoload -Uz compinit
compinit

if _installed roam; then
    compdef roam=git
fi

# Source all functions from site-functions
for func in $HOME/.local/share/zsh/site-functions/*; do
    if [[ -r "$func" ]]; then
        autoload -Uz "${func:t}"
    fi
done

##########################
# Other Shell Extensions #
##########################

# zsh-syntax-highlighting
_safe_source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Shell completion for gcloud
_safe_source /opt/homebrew/Caskroom/gcloud-cli/latest/google-cloud-sdk/completion.zsh.inc

# Starship allows you to easily create a customized shell prompt
# https://starship.rs/config/
# ~/.config/starship.toml
if _installed starship; then
    eval "$(starship init zsh)"
fi

# fzf is a general-purpose command-line fuzzy finder
# https://junegunn.github.io/fzf/getting-started/
if _installed fzf; then
    eval "$(fzf --zsh)"
    alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
fi

# mise manages development environments, environment variables, and tasks
# https://mise.jdx.dev/walkthrough.html
if _installed mise; then
    eval "$(mise activate zsh)"
fi

# zoxide is a smarter cd command
# https://github.com/ajeetdsouza/zoxide/blob/main/README.md
if _installed zoxide; then
    eval "$(zoxide init zsh)"
    zd() {
        if [ $# -eq 0 ]; then
            builtin cd ~ && return
        elif [ -d "$1" ]; then
            builtin cd "$1"
        else
            z "$@" && printf " \U000F17A9 " && pwd || echo "Error: Directory not found"
        fi
    }
    alias cd="zd"
fi
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# A modern, maintained replacement for ls
# https://eza.rocks/
if _installed eza; then
    # shellcheck disable=SC2262
    alias ls='eza -lh --group-directories-first --icons=auto'
    alias lt='eza --tree --level=2 --long --icons --git'
    alias lta='lt -a'
else
    # shellcheck disable=SC2010,SC2263
    if ls --version 2>/dev/null | grep -qi gnu; then
        alias ls='\ls --color=auto'
    else
        alias ls='\ls -G'
    fi
fi
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'

if _installed xdg-open; then
    open() {
        exec xdg-open "$@" >/dev/null 2>&1 &
    }
fi

if _installed wl-copy; then
    pbcopy() {
        exec wl-copy "$@"
    }
    pbpaste() {
        exec wl-paste "$@"
    }
fi
