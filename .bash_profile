if [ -f /gapp/noarch/share/login/gapp.profile ]; then
    source /gapp/noarch/share/login/gapp.profile
fi

if which keychain 1> /dev/null; then
    eval $(keychain --eval --quiet)
fi

if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi
