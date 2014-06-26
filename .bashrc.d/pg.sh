POSTGRES_HOME=/Applications/Postgres.app/Contents/Versions/9.3

if [ -d "$POSTGRES_HOME" ]
then
    export POSTGRES_HOME
else
    unset POSTGRES_HOME
fi
