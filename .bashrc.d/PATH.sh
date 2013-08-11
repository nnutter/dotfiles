[ -d "/var/lib/gems/1.8/bin" ] && export PATH="/var/lib/gems/1.8/bin:$PATH"

if [ -d "${HOME}/.local/bin" ]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi

if [ -d ${HOME}/.bin ]; then
    export PATH=${HOME}/.bin:${PATH}
fi

if [ -d ${HOME}/bin ]; then
    export PATH=${HOME}/bin:${PATH}
fi

if [ -d /usr/local/share/python ]; then
    export PATH=/usr/local/share/python:${PATH}
fi

if [ -d /usr/local/bin ]; then
    export PATH=/usr/local/bin:${PATH}
fi

if [ -d "/usr/local/sbin" ]; then
    PATH="$PATH:/usr/local/sbin"
fi

if [ -d "$HOME/.bin" ]; then
    PATH="$PATH:$HOME/.bin"
fi

PATH="$PATH:."

export PATH
