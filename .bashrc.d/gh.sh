alias gh='git --git-dir $HOME/.dotfiles.git --work-tree $HOME'
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main gh
