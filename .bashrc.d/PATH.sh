if test -d "/var/lib/gems/1.8/bin"
then
    export PATH="/var/lib/gems/1.8/bin${PATH:+:}$PATH"
fi

if test -d "${HOME}/.local/bin"
then
    export PATH="${HOME}/.local/bin${PATH:+:}${PATH}"
fi

if test -d ${HOME}/.bin
then
    export PATH=${HOME}/.bin${PATH:+:}${PATH}
fi

if test -d ${HOME}/bin
then
    export PATH=${HOME}/bin${PATH:+:}${PATH}
fi

if test -d /usr/local/bin
then
    export PATH=/usr/local/bin${PATH:+:}${PATH}
fi

if test -d "/usr/local/sbin"
then
    PATH="$PATH${PATH:+:}/usr/local/sbin"
fi

if test -d "$HOME/.bin"
then
    PATH="$PATH${PATH:+:}$HOME/.bin"
fi

PATH="$PATH${PATH:+:}."

export PATH
