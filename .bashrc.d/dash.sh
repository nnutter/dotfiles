# Open argument in Dash
dash() {
    open "dash://$(urlenc "$@")"
}

dman() {
    open "dash://man:$(urlenc "$@")"
}
