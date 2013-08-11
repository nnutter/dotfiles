if [ -x "$(which notify-send)" ]; then
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
fi
if [ -x "$(which growlnotify)" ]; then
    alias alert='growlnotify -s -a Terminal -t "$([ $? = 0 ] && echo command successful || echo command error)" -m "$(history | tail -n 1 | sed -e '\''s/^\ *[0-9]*\ *//'\'' -e '\''s/;\ *alert$//'\'')"'
fi
