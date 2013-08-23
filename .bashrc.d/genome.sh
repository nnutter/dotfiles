if [ -n "$(which genome 2> /dev/null)" ]; then
    alias DEV='UR_STACK_DUMP_ON_DIE=1 UR_DBI_NO_COMMIT=1 GENOME_DEV_MODE=1'
    alias dgenome='perl -d $(which genome)'
    alias dgmt='perl -d $(which gmt)'
    alias genome-debug='perl -d:ptkdb `which genome`'
    alias genome-debug-test='DEV genome-debug'
    alias genome-test='DEV genome'
    alias genome-test-debug='DEV genome-debug'

    export GENOME_QUERY_POSTGRES=1

    go() {
        cd $(find_snapshot "$1")
    }
fi
