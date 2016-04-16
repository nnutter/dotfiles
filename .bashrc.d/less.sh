if test -n "$XDG_CACHE_HOME"
then
    LESSBASEDIR="$XDG_CACHE_HOME/less"
    if ! test -d "$LESSBASEDIR"
    then
        mkdir "$LESSBASEDIR"
    fi
    LESSHISTFILE="$LESSBASEDIR/history"
fi
