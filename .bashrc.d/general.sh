# disable flow control (^s and ^q)
if [ -t 0 ]; then
    stty -ixon
fi

# disable PC speaker
#setterm -bfreq 0
