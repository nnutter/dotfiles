for FILE in "$HOME"/.asdf/asdf.sh "$HOME"/.asdf/completions/asdf.bash
do
    test -f "$FILE" && source "$FILE"
done
