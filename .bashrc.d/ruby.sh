if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

function erb-c {
    if [ -f "$1" ]; then
        erb -P -x -T '-' "$1" | ruby -c
        return
    fi
    if [ -z "$1" ]; then
        echo "Usage:"
        echo "   erb-c <file>"
    else
        echo "ERROR: No such file: $1"
    fi
}
