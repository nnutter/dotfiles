# _installed checks if an executable exists
function _installed {
    type "$1" &>/dev/null
}

autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd vv edit-command-line

function vi-yank-clipboard {
    zle vi-yank
    if _installed wl-copy; then
        echo "$CUTBUFFER" | wl-copy
    else
        echo "$CUTBUFFER" | pbcopy
    fi
}
zle -N vi-yank-clipboard
bindkey -M vicmd y vi-yank-clipboard
