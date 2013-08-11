up_with_sandbox() {
    command vagrant up --no-provision
    command vagrant sandbox on
    command vagrant provision
}

vagrant_sup() {
    case $SB_MODE in
        on)
            command vagrant up
            ;;
        *)
            up_with_sandbox
            ;;
    esac
}

vagrant_rebuild() {
    case $SB_MODE in
        on)
            command vagrant sandbox rollback
            command vagrant provision
            ;;
        *)
            command vagrant destroy
            up_with_sandbox
            ;;
    esac
}

vagrant() {
    SB_MODE=$(command vagrant sandbox status | sed 's/.*snapshot mode is //')
    ACTION=$1
    case $ACTION in
        s|sup)
            vagrant_sup
            ;;
        r|rebuild)
            vagrant_rebuild
            ;;
        help|-h|--help|'')
            command vagrant help
            echo -e "\nAdditional Subcommands:"
            echo -e "\tsup - bring vagrant up but ensure sandbox is enabled before provisioning"
            echo -e "\trebuild - rollback (or destroy) and re-provision"
            ;;
        p)
            shift
            command vagrant provision "$@"
            ;;
        *)
            command vagrant "$@"
            ;;
    esac
}
