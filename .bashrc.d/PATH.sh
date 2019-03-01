if test -d "/var/lib/gems/1.8/bin"
then
    PATH="/var/lib/gems/1.8/bin${PATH:+:}$PATH"
fi

if test -d "${HOME}/.local/bin"
then
    PATH="${HOME}/.local/bin${PATH:+:}${PATH}"
fi

if test -d ${HOME}/.bin
then
    PATH=${HOME}/.bin${PATH:+:}${PATH}
fi

if test -d ${HOME}/bin
then
    PATH=${HOME}/bin${PATH:+:}${PATH}
fi

if test -d "${HOME}/Library/Python/2.7/bin"
then
    PATH="$PATH":"${HOME}/Library/Python/2.7/bin"
fi

PATH="$PATH${PATH:+:}."

export PATH
