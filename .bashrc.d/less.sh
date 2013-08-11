if [ -n "$XDG_CACHE_HOME" ]; then
    LESSBASEDIR="$XDG_CACHE_HOME/less"
    [ ! -d "$LESSBASEDIR" ] && mkdir "$LESSBASEDIR"
    LESSHISTFILE="$LESSBASEDIR/history"
fi
