_complete_running_apps ()
{
  local cur prev
  local LC_ALL='C'

  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}

  # do not attempt completion if we're specifying an option
  [[ "$cur" == -* ]] && return 0

  # Escape dots in paths for grep
  cur=${cur//\./\\\.}

  local IFS="
"
  COMPREPLY=( $( echo "$(osascript -e "set AppleScript's text item delimiters to \"\n\"" -e "tell application \"System Events\" to return (displayed name of every application process whose (background only is false and displayed name is not \"Finder\")) as text" 2>/dev/null)"|grep -i "^$cur" | sed -e 's/ /\\ /g' ) )

  return 0
}

complete -o bashdefault -o default -o nospace -F _complete_running_apps quit 2>/dev/null || complete -o default -o nospace -F _complete_running_apps quit
