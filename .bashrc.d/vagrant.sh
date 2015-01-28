up_with_sandbox() {
    command vagrant up --no-provision "$@"
    command vagrant sandbox on "$@"
    command vagrant provision "$@"
}

vagrant_up() {
    case $SB_MODE in
        on)
            command vagrant up "$@"
            ;;
        *)
            up_with_sandbox "$@"
            ;;
    esac
}

vagrant_rebuild() {
    case $SB_MODE in
        on)
            command vagrant sandbox rollback "$@"
            sleep 3
            command vagrant reload "$@"
            command vagrant provision "$@"
            ;;
        *)
            command vagrant destroy "$@"
            up_with_sandbox "$@"
            ;;
    esac
}

vagrant() {
    ACTION=$1
    shift
    case $ACTION in
        s|up|up)
            SB_MODE=$(command vagrant sandbox status "$@" | sed 's/.*mode is //')
            vagrant_up "$@"
            ;;
        r|rebuild)
            SB_MODE=$(command vagrant sandbox status "$@" | sed 's/.*mode is //')
            vagrant_rebuild "$@"
            ;;
        -h|--help|'')
            command vagrant help "$@"
            echo -e "\nMods:"
            echo -e "\tup - bring vagrant up but ensure sandbox is enabled before provisioning"
            echo -e "\trebuild - rollback (or destroy) and re-provision"
            ;;
        p)
            command vagrant provision "$@"
            ;;
        *)
            command vagrant $ACTION "$@"
            ;;
    esac
}
