if test "$OS" == "Darwin"
then
    alias ls='\ls -G'
fi

if test "$OS" == "Linux"
then
    alias ls='\ls --color=auto'
fi

alias ll='ls -lh'
alias la='ll -a'
alias lt='ll -rt'

alias pd='pushd > /dev/null'
