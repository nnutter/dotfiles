function note {
    local DATE=$(date +%Y-%m-%d-%H-%M-%S)
    local PATH="$HOME/Notes/$DATE.md"
    $EDITOR $PATH
}
