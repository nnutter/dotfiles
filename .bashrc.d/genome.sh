if type -p genome > /dev/null
then
    alias DEV='UR_STACK_DUMP_ON_DIE=1 UR_DBI_NO_COMMIT=1 GENOME_DEV_MODE=1'

    go() {
        cd $(find_snapshot "$1")
    }
fi
