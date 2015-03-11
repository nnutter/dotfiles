if type -p notify-send > /dev/null
then
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
fi

if type -p growlnotify > /dev/null
then
    alias alert='growlnotify -s -a Terminal -t "$([ $? = 0 ] && echo command successful || echo command error)" -m "$(history | tail -n 1 | sed -e '\''s/^\ *[0-9]*\ *//'\'' -e '\''s/;\ *alert$//'\'')"'
fi
