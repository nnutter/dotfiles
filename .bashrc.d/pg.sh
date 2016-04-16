POSTGRES_HOME=/Applications/Postgres.app/Contents/Versions/9.3

if test -d "$POSTGRES_HOME"
then
    export POSTGRES_HOME
    export PATH="${PATH}:${POSTGRES_HOME}/bin"
else
    unset POSTGRES_HOME
fi
