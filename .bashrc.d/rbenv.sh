if test -d /usr/local/var/rbenv
then
    export RBENV_ROOT=/usr/local/var/rbenv
fi

if type -p rbenv > /dev/null
then
    eval "$(rbenv init -)"
fi
